
# importing various libraries
import ok
import sys, os, time
from PyQt5.QtWidgets import QDialog, QApplication, QPushButton, QVBoxLayout, QHBoxLayout, QWidget, QLabel, QLineEdit
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
import matplotlib.pyplot as plt

# System initial parameters
FIFO_SIZE = 2044
#BIT_FILE = 'ultra_demo.bit'
BIT_FILE = 'xem7320_adc.bit'

XEM_SN = ""
sample = bytearray(b'0000000000000000') # 16 byte sample size

# main window
# which inherits QDialog
class Window(QDialog):
        
    # constructor
    def __init__(self, parent=None):
        super(Window, self).__init__(parent)

        self.init_done = False
        self.initTx_done = False
        self.initRx_done = False

        # Main Canvas
        # setting title
        self.setWindowTitle("Ultra project demo")
        # setting geometry
        self.setGeometry(100, 100, 1200, 500)
        # setting background color
        self.setStyleSheet("background-color: black;")

        # User Interaction Container
        uiContainer = QWidget(self)
        uiContainer.setContentsMargins(0, 0, 0, 0)
        uiContainer.setFixedSize(300, 500)
        uiContainer.move(900, 0)
        uiContainer.setStyleSheet("background-color:black;")
        uibox = QVBoxLayout(uiContainer)
        uibox.setContentsMargins(10, 10, 10, 10)

        self.statusLB = QLabel("Status: Uninitialized..")
        self.statusLB.setStyleSheet("color: blue;") 

        self.blankLB = QLabel("")
        self.blankLB.setStyleSheet("color: gray;") 

        self.label1 = QLabel("FPGA bit file:")
        self.label1.setStyleSheet("color: white;") 

        self.text_input1 = QLineEdit()
        self.text_input1.setStyleSheet("color: white;") 
        self.text_input1.setText(BIT_FILE)

        self.label2 = QLabel("# Samples for Acquisition:")
        self.label2.setStyleSheet("color: white;") 

        self.text_input2 = QLineEdit()
        self.text_input2.setStyleSheet("color: white;") 
        self.text_input2.setText(str(FIFO_SIZE))

        self.sysSetButton = QPushButton("Initialize System")
        self.sysSetButton.clicked.connect(self.initSys)
        self.sysSetButton.setStyleSheet("background-color: white;")

        self.txSetButton = QPushButton("Set Transmit Options")
        self.txSetButton.clicked.connect(self.initTx)
        self.txSetButton.setStyleSheet("background-color: white;")

        self.rxSetButton = QPushButton("Set Receive Options")
        self.rxSetButton.clicked.connect(self.initRx)
        self.rxSetButton.setStyleSheet("background-color: white;")

        self.strButton = QPushButton("Start Acquisition")
        self.strButton.clicked.connect(self.acquireData)
        self.strButton.setStyleSheet("background-color: white;")

        self.resetButton = QPushButton("Software Reset")
        self.resetButton.clicked.connect(self.reset)
        self.resetButton.setStyleSheet("background-color: white;")


        uibox.addStretch()

        uibox.addWidget(self.resetButton)
        uibox.addWidget(self.statusLB)
        uibox.addWidget(self.blankLB)
        uibox.addWidget(self.label1)
        uibox.addWidget(self.text_input1)
        uibox.addWidget(self.label2)
        uibox.addWidget(self.text_input2)
        uibox.addWidget(self.sysSetButton)
        uibox.addWidget(self.txSetButton)
        uibox.addWidget(self.rxSetButton)
        uibox.addWidget(self.strButton)

        # Plot Container
        plotContainer = QWidget(self)
        plotContainer.setContentsMargins(0, 0, 0, 0)
        plotContainer.setFixedSize(900, 500)
        plotContainer.move(0, 0)
        plotContainer.setStyleSheet("background-color:black;")
        plotbox = QVBoxLayout(plotContainer)
        plotbox.setContentsMargins(10, 10, 10, 10)

        # a figure instance to plot on
        self.figure = plt.figure()
        self.canvas = FigureCanvas(self.figure)
        plotbox.addWidget(self.canvas)

    def reset(self):
        if self.init_done:
            self.dev.SetWireInValue(0x00,0x1) # assert reset
            self.dev.UpdateWireIns()
            time.sleep(.1)
            self.dev.SetWireInValue(0x00,0x0)
            self.dev.UpdateWireIns() # deassert reset
            time.sleep(.1)

    def initSys(self):

        self.init_done = True

        # Initial Parameter Setup
        curr_dir = os.path.dirname(os.path.abspath(__file__))
        bit_file = self.text_input1.text()
        bit_file_conf = os.path.join(curr_dir, bit_file)

        try:
            self.FIFO_SIZE = int(self.text_input2.text())
        except ValueError:
            # Handle the case where the input cannot be converted to an integer
            # You can show an error message, set a default value, or take any other appropriate action.
            self.statusLB.setText("Status: Aquisition done!")
            print("Invalid input. Please enter a valid integer.")
            self.FIFO_SIZE = FIFO_SIZE
            self.init_done = False

        # Opal Kelly Configuration
        self.dev = ok.okCFrontPanel()
        if (self.dev.OpenBySerial(XEM_SN) != 0):
            self.init_done = False
            print("Device couldn't be opened. Is one connected?")

        if os.path.exists(bit_file_conf):
            if (self.dev.ConfigureFPGA(bit_file_conf) != 0):
                self.init_done = False
                print("Error programming device with bitfile")
        else:
            print("Bitfile does not exist")

        # Initial System Reset
        self.dev.SetWireInValue(0x00,0x1) # assert reset
        self.dev.UpdateWireIns()
        time.sleep(.1)
        self.dev.SetWireInValue(0x00,0x0)
        self.dev.UpdateWireIns() # deassert reset
        time.sleep(.1)

        # Set acquisition sample length
        self.dev.SetWireInValue(0x01,self.FIFO_SIZE) # assert reset
        self.dev.UpdateWireIns()
        time.sleep(.1)

        if self.init_done:
            self.statusLB.setText("Status: Now Initialized..")
        else:
            self.statusLB.setText("Status: Init Failed..!!")

    def initTx(self):
    
        if self.init_done:
            
            self.initTx_done = True

            # test
            spi_rw = 0b0                # 0 write / 1 read
            spi_reg_addr = 0b0010       # reg 0x02
            spi_data = 0b00000000       # Twos complement (1) / unsigned binary (0)
            spi_full = ( ((spi_rw << 7) | (0b00 << 5) | spi_reg_addr) << 8 ) | spi_data

            self.dev.SetWireInValue(0x02,spi_full) # copy SPI reg / word
            self.dev.UpdateWireIns()
            time.sleep(.01)
            self.dev.ActivateTriggerIn(0x40, 1) # start SPI communication (2nd bit trigger on ep40)
            time.sleep(.01)

            spi_rw = 0b0                # 0 write / 1 read
            spi_reg_addr = 0b0011       # reg 0x03 (I DAC Gain)
            spi_data = 0b00000000       #
            spi_full = ( ((spi_rw << 7) | (0b00 << 5) | spi_reg_addr) << 8 ) | spi_data
            print(spi_full)

            self.dev.SetWireInValue(0x02,spi_full) # copy SPI reg / word
            self.dev.UpdateWireIns()
            time.sleep(.01)
            self.dev.ActivateTriggerIn(0x40, 1) # start SPI communication (2nd bit trigger on ep40)
            time.sleep(.01)

            spi_rw = 0b0                # 0 write / 1 read
            spi_reg_addr = 0b0001       # reg 0x01 Power-down
            spi_data = 0b01010100       # Q channel off
            spi_full = ( ((spi_rw << 7) | (0b00 << 5) | spi_reg_addr) << 8 ) | spi_data
            print(spi_full)

            self.dev.SetWireInValue(0x02,spi_full) # copy SPI reg / word
            self.dev.UpdateWireIns()
            time.sleep(.01)
            self.dev.ActivateTriggerIn(0x40, 1) # start SPI communication (2nd bit trigger on ep40)
            time.sleep(.01)


            # real

            spi_rw = 0b0                # 0 write / 1 read
            spi_reg_addr = 0b0101       # reg 0x05
            #spi_data = 0b10000000       # IRCML 60 ohm
            spi_data = 0b10111111       # IRCML 260 ohm
            spi_full = ( ((spi_rw << 7) | (0b00 << 5) | spi_reg_addr) << 8 ) | spi_data
            print(spi_full)

            self.dev.SetWireInValue(0x02,spi_full) # copy SPI reg / word
            self.dev.UpdateWireIns()
            time.sleep(.01)
            self.dev.ActivateTriggerIn(0x40, 1) # start SPI communication (2nd bit trigger on ep40)
            time.sleep(.01)

            spi_rw = 0b0                # 0 write / 1 read
            spi_reg_addr = 0b1000       # reg 0x08
            spi_data = 0b10000000       # QRCML 60 ohm
            spi_full = ( ((spi_rw << 7) | (0b00 << 5) | spi_reg_addr) << 8 ) | spi_data
            print(spi_full)

            self.dev.SetWireInValue(0x02,spi_full) # copy SPI reg / word
            self.dev.UpdateWireIns()
            time.sleep(.01)
            self.dev.ActivateTriggerIn(0x40, 1) # start SPI communication (2nd bit trigger on ep40)
            time.sleep(.01)

            spi_rw = 0b0                # 0 write / 1 read
            spi_reg_addr = 0b0100       # reg 0x04
            spi_data = 0b10100000       # IRset 1.6 kohm (on-chip IRset enabled)
            spi_full = ( ((spi_rw << 7) | (0b00 << 5) | spi_reg_addr) << 8 ) | spi_data
            print(spi_full)

            self.dev.SetWireInValue(0x02,spi_full) # copy SPI reg / word
            self.dev.UpdateWireIns()
            time.sleep(.01)
            self.dev.ActivateTriggerIn(0x40, 1) # start SPI communication (2nd bit trigger on ep40)
            time.sleep(.01)

            spi_rw = 0b0                # 0 write / 1 read
            spi_reg_addr = 0b0111       # reg 0x07
            spi_data = 0b10100000       # QRset 1.6 kohm
            spi_full = ( ((spi_rw << 7) | (0b00 << 5) | spi_reg_addr) << 8 ) | spi_data
            print(spi_full)
            
            self.dev.SetWireInValue(0x02,spi_full) # copy SPI reg / word
            self.dev.UpdateWireIns()
            time.sleep(.01)
            self.dev.ActivateTriggerIn(0x40, 1) # start SPI communication (2nd bit trigger on ep40)
            time.sleep(.01)

            if self.initTx_done:
                self.statusLB.setText("Status: Tx option updated..")
            else:
                self.statusLB.setText("Status: Tx option update failed..!!")

    def initRx(self):
        
        if self.init_done:
            
            self.initRx_done = True

            try:
                self.FIFO_SIZE = int(self.text_input2.text())
            except ValueError:
                # Handle the case where the input cannot be converted to an integer
                # You can show an error message, set a default value, or take any other appropriate action.
                print("Invalid input. Please enter a valid integer.")
                self.FIFO_SIZE = FIFO_SIZE
                self.initRx_done = False

            # Set acquisition sample length
            self.dev.SetWireInValue(0x01,self.FIFO_SIZE) # assert reset
            self.dev.UpdateWireIns()
            time.sleep(.1)

            if self.initRx_done:
                self.statusLB.setText("Status: Rx option updated..")
            else:
                self.statusLB.setText("Status: Rx option update failed..!!")
            
    # action called by the push button
    def acquireData(self):

        if self.init_done:

            self.adc_data = [0] * self.FIFO_SIZE

            self.dev.ActivateTriggerIn(0x40, 0) # fill fifo
            time.sleep(.01)

            for x in range(0, self.FIFO_SIZE, 4):
                error_check = self.dev.ReadFromPipeOut(0xA0, sample) # read pipe into buffer
                
                if (error_check != 16):
                    print("Error reading pipe.")

                # convert data from ADC
                for y in range(4):
                    self.adc_data[x+y] = (int.from_bytes(sample[y*4:y*4+2], "big") >> 2) - 0x2000 # remove the 2 zero bits

            self.plot()
            self.statusLB.setText("Status: Aquisition done!")

    def plot(self):
          
        # clearing old figure
        self.figure.clear()
  
        # create an axis
        ax = self.figure.add_subplot(111)
  
        # plot data
        ax.plot(range(self.FIFO_SIZE), self.adc_data, label="Acquired data")
        ax.set_xlabel('sample number')
        ax.set_ylabel('adc reading')
        ax.grid(True)

        # refresh canvas
        self.canvas.draw()

# driver code
if __name__ == '__main__':
      
    # creating apyqt5 application
    app = QApplication(sys.argv)
  
    # creating a window object
    main = Window()
      
    # showing the window
    main.show()
  
    # loop
    sys.exit(app.exec_())