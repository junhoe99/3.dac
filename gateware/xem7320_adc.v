//------------------------------------------------------------------------
// syzygy-brain-adc.v
//
// This sample desmonstrates usage of the POD-ADC-LTC226x SYZYGY module
// from Opal Kelly. This sample is setup to interface with an ADC Pod
// connected on PORT D.
//
// Communication with the ADC itself is handled by the syzygy-adc-top
// module which returns parallel data from each of the ADC channels. This
// data is then fed into a FIFO and DMA through to the Zynq DRAM as part
// of the block design 'design_1'.
//
//------------------------------------------------------------------------
// Copyright (c) 2018 Opal Kelly Incorporated
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//------------------------------------------------------------------------

`default_nettype none

module xem7320_adc(
    input  wire [4:0]           okUH,
    output wire [3:0]           okHU,
    inout  wire [31:0]         okUHU,
    inout  wire                 okAA,

    // ADC Pins
    input  wire               sys_clkp,
    input  wire               sys_clkn,
    input  wire [1:0]         adc_out_1p, // Channel 1 data
    input  wire [1:0]         adc_out_1n,
    input  wire [1:0]         adc_out_2p, // Channel 2 data
    input  wire [1:0]         adc_out_2n,
    input  wire               adc_dco_p,      // ADC Data clock
    input  wire               adc_dco_n,
    input  wire               adc_fr_p,       // Frame input
    input  wire               adc_fr_n,
    output wire               adc_encode_p,   // ADC Encode Clock
    output wire               adc_encode_n,
    input  wire               adc_sdo,
    output wire               adc_sdi,
    output wire               adc_cs_n,
    output wire [7:0]         led,
    output wire               adc_sck,

// DAC Pins
output wire [11:0]  dac_data,        // I/Q Data
output wire         dac_clk,
output wire         dac_reset_pinmd,
output wire         dac_sclk,        // SPI Clock
output wire         dac_sdio,        // SPI Data I/O
output wire         dac_cs_n,        // SPI Chip Select
//output wire         dac_opamp_en,

// BRKOUT Pins
output wire [7:0] m_dbg_signal

);


// Target interface bus:
wire         okClk;
wire [112:0] okHE;
wire [64:0]  okEH;

wire [31:0]  ep40trig;
wire [31:0]  ep00data; // SW reset
wire [31:0]  ep01data; // Rx FIFO sample size
wire [31:0]  ep02data; // DAC SPI register


wire [31:0]  pipea0_data;

wire         reset;
wire         idelay_rdy;
wire         ep_read;
wire         adc_data_clk;
wire         adc_clk;
wire         adc_data_valid;
wire         prog_full;
wire         acq_start;
wire [7:0]   status_signals;
wire         enc_clk_locked;
wire         locked;
wire         sys_clk_ibuf;
wire         sys_clk_bufg;
wire         rd_rst_busy;
wire         wr_rst_busy;
wire [7:0]   debugpin;
wire [15:0]  adc_data_out1, adc_data_out2;
reg          wr_en = 1'b0;
reg tx_en = 1'b0;
reg tx_done;
reg          fifo_reset;
reg          fifo_busy;

// DAC signals


assign locked = idelay_rdy & enc_clk_locked;
assign reset = ep00data[0];
assign acq_start = ep40trig[0];
/* assign status_signals = {acq_start, reset, enc_clk_locked, idelay_rdy, adc_data_valid, fifo_busy, locked, prog_full};
function [7:0] xem7320_led;
input [7:0] a;
integer i;
begin
for(i=0; i<8; i=i+1) begin: u
xem7320_led[i] = a[i];
end
end
endfunction */

/* assign led = xem7320_led(status_signals); */

// Main Controller Design
reg [31:0] rx_sample_counter = 32'd0;
reg [2:0] main_state = 3'b000;
localparam main_idle = 0,
           rx_rdy = 1,
           tx_init = 2,
           tx_pulse_gen = 3,
  rx_cnt = 4;

always @ (posedge adc_data_clk) begin
case (main_state)
        main_idle: begin
wr_en <= 1'b0;
tx_en <= 1'b0;
            if (locked && !prog_full && adc_data_valid && !fifo_busy) begin
                main_state <= rx_rdy;
            end
            else begin
                main_state <= main_idle;
            end
        end  

rx_rdy: begin // wait for acquisition start trigger
wr_en <= 1'b0;
tx_en <= 1'b0;
            if (acq_start) begin
                main_state <= tx_init;
            end

        end

tx_init: begin
wr_en <= 1'b0;
tx_en <= 1'b0;
            main_state <= tx_pulse_gen;
        end

tx_pulse_gen: begin
wr_en <= 1'b0;
tx_en <= 1'b1;
if (tx_done) begin
rx_sample_counter <= ep01data;
main_state <= rx_cnt;
end
else begin
                main_state <= tx_pulse_gen;
            end
        end

rx_cnt: begin
rx_sample_counter <= rx_sample_counter - 1'b1;
wr_en <= 1'b1;
tx_en <= 1'b0;
if (rx_sample_counter == 32'd0) begin
                main_state <= main_idle;
            end
        end

endcase
end

//assign led[2:0] = main_state+1;
assign led[7:0] = 8'b11111111;
//always @ (posedge adc_data_clk) begin
// if (main_state == tx_pulse_gen) begin
// tx_done <= 1'b1;
// end
// else begin
// tx_done <= 1'b0;
// end
//end



reg [7:0] delay_counter = 8'd0;
reg [1:0] state = 2'b00;
localparam idle = 0,
           wait_for_lock = 3,
           reset_state = 1,
           delay_wait = 2;

// Worst case is using ADC-12 project, in which
// okClk (100.8 MHz) is 2.52x faster than adc_clk (40 MHz)
// first wait for MMCM to lock, then the
// reset should be asserted for 21 cycles,
// and then should wait for 152 cycles, for a
// total of 173 cycles the FIFO is resetting.
// See PG057 Figure 3-29 for more information.
always @ (posedge okClk) begin
    case (state)
        idle: begin
            if (reset) begin
                fifo_reset <= 1'b1;
                state <= wait_for_lock;
                fifo_busy <= 1'b1;
            end
            else begin
                fifo_busy <= 1'b0;
                fifo_reset <= 1'b0;
            end
        end
       
        wait_for_lock: begin // wait for MMCM to lock
            if (locked) begin
                delay_counter = 8'd21;
                state <= reset_state;
            end
        end
       
        reset_state: begin // assert reset for 21 cycles after MMCM is locked
            delay_counter <= delay_counter - 1'b1;
            if (delay_counter == 8'd0) begin
                fifo_reset <= 1'b0;
                delay_counter <= 8'd152;
                state <= delay_wait;
            end
        end
       
        delay_wait: begin // deassert fifo_busy after 152 cycles
            delay_counter <= delay_counter - 1'b1;
            if (delay_counter == 8'd0) begin
                fifo_busy <= 1'b0;
                state <= idle;
            end
        end
    endcase
end

// DAC Tx signal generation
reg [11:0] dac_counter;

assign dac_clk = phy_clk;

wire phy_clk, locked_dac_clk;
clk_wiz_0 phy_pll(
// Clock out ports
.clk_out1 (phy_clk),
// Status and control signals
.reset    (reset),
.locked   (locked_dac_clk),
// Clock in ports
.clk_in1  (okClk)
);



////12-bit 5MHz DAC data generation
//reg [2:0] clk_en_count; // clk_en이 1이 된 횟수를 세는 카운터
//reg [11:0] clk_counter;
//reg [11:0] dac_out;
//reg        prev_clk_en=1'b1;
//reg   clk_en;
//reg   rect =1'b0;
//always @(negedge phy_clk) begin
//    clk_en <= 1'b0;
//    if (reset == 1'b1) begin
//        clk_counter <= 12'h00;
//        tx_done    <= 1'b0;
//        clk_en_count <= 2'b00; // 리셋 시 카운터 초기화
//    end else begin
//        if (tx_en) begin
//            clk_counter <= clk_counter + 1'b1;
//            if (clk_counter == 12'd0) begin    
//                clk_en <= 1'b1;
//            end
//        end
//        if (clk_counter == 12'd9) begin
//            clk_counter <= 12'h00;
//            clk_en_count <= clk_en_count + 1; // clk_en이 1일 때 카운터 증가
//        end else begin    
//            tx_done <= 1'b0;    
//        end    
       
//        if (clk_en_count == 3'd4) begin
//            tx_done <= 1'b1; // clk_en이 3번 연속 1이 되면 tx_done을 1로 설정
//        end else begin
//            tx_done <= 1'b0; // 그 외의 경우에는 tx_done을 0으로 설정
//        end
       
//        if (clk_en != prev_clk_en) begin
//            if (clk_en == 1'b1) begin
//                rect <= rect; // clk_en이 1이 될 때까지 rect 값을 유지함
//            end else begin
//                rect <= ~rect; // clk_en이 1이 아닐 때만 rect 값을 반전시킴
//            end
//        end
//        prev_clk_en <= clk_en; // 이전 clk_en 값을 저장하여 다음에 사용

//        if (rect == 1'b1) begin
//            dac_out <= 12'b111111111111;
//        end else begin
//            dac_out <= 12'b000000000000;
//        end
//    end
//end


// 12-bit counter DAC data generation
/*always @ (negedge phy_clk) begin
if (reset == 1'b1) begin
dac_counter <= 12'b111111111111;
tx_done <= 1'b0;
end else begin
if (tx_en) begin
dac_counter <= dac_counter - 1'b1;
end
if (dac_counter <= 12'b000000000010) begin // make tx_done 3 cycles for slow adc_data_clk
tx_done <= 1'b1;
end else begin
tx_done <= 1'b0;
end
if (dac_counter == 12'b000000000000) begin
dac_counter <= 12'b111111111111;
end
end
end*/

selectio_wiz_0 dac_io(
.data_out_from_device ({data_q_r, data_i_r}),
.data_out_to_pins     ({dac_data[11:0]}),
.clk_in               (phy_clk),
.io_reset             (~locked_dac_clk | ~tx_en)
);

// DAC SPI settings
reg        dac_spi_start;
wire [15:0] dac_spi_full;
assign dac_spi_full = ep02data[15:0];

always @(posedge okClk) begin
if (reset) begin
dac_spi_start <= 1'b0;
end else begin
dac_spi_start <= ep40trig[1];
end
end

//signal_gen
signal_gen signal_gen(
//Front Panel
//    input  wire [4:0]  okUH,
//	output wire [3:0]  okHU,
//	input  wire [3:0]  okRSVD,
//	inout  wire [31:0] okUHU,
//	inout  wire        okAA,

	// DAC Connections
	.dac_data              (dac_data),        // I/Q Data
	.dac_clk               (dac_clk),
	.dac_reset_pinmd       (dac_reset_pinmd),
	.dac_sclk              (dac_sclk),        // SPI Clock
	.dac_sdio              (dac_sdio),        // SPI Data I/O
	.dac_cs_n              (dac_cs_n)       // SPI Chip Select
);


syzygy_dac_spi_module dac_spi_inst(
.reset (reset),
.okClk (okClk),
.dac_spi_start (dac_spi_start),
.dac_spi_full (dac_spi_full),
.dac_reset_pinmd(dac_reset_pinmd),
.dac_sclk (dac_sclk),
.dac_sdio (dac_sdio),
.dac_cs_n (dac_cs_n)
);

wire idelay_ref;
enc_clk enc_clk_inst
   (
    // Clock out ports
    .clk_out1(adc_clk),     // output clk_out1
    .clk_out2(idelay_ref),
    // Status and control signals
    .reset(reset), // input reset
    .locked(enc_clk_locked),       // output locked
   // Clock in ports
    .clk_in1_p(sys_clkp),      // input clk_in1
    .clk_in1_n(sys_clkn)      // input clk_in1
);

syzygy_adc_top adc_impl(
.clk          (adc_clk),
.idelay_ref   (idelay_ref),
.reset_async  (reset),

.adc_out_1p   (adc_out_1p),
.adc_out_1n   (adc_out_1n),
.adc_out_2p   (adc_out_2p),
.adc_out_2n   (adc_out_2n),
.adc_dco_p    (adc_dco_p),
.adc_dco_n    (adc_dco_n),
.adc_fr_p     (adc_fr_p),
.adc_fr_n     (adc_fr_n),
.adc_encode_p (adc_encode_p),
.adc_encode_n (adc_encode_n),
.adc_sdo      (adc_sdo),
.adc_sdi      (adc_sdi),
.adc_cs_n     (adc_cs_n),
.adc_sck      (adc_sck),

.adc_data_clk (adc_data_clk),
.adc_data_1   (adc_data_out1),
.adc_data_2   (adc_data_out2),
.data_valid   (adc_data_valid),
.idelay_rdy   (idelay_rdy)
);
 fifo_generator_0 fifo(
    .wr_clk         (adc_data_clk),
    .rd_clk         (okClk),
    .rst            (fifo_reset),
    .din            ({adc_data_out1,adc_data_out2}),
    .wr_en          ({wr_en & ~fifo_busy}),
    .rd_en          ({ep_read & ~fifo_busy}),
    .dout           ({pipea0_data[7:0], pipea0_data[15:8], pipea0_data[23:16], pipea0_data[31:24]}),
    .full           (),
    .wr_rst_busy    (wr_rst_busy),
    .rd_rst_busy    (rd_rst_busy),
    .empty          (),
    .prog_full      (prog_full)
);

//fifo read counter
reg [11:00] fifo_rd_cnt;
always @ (posedge okClk) begin
if (reset | ~ep_read) begin
fifo_rd_cnt <= 12'b000000000000;
end
else begin
fifo_rd_cnt <= fifo_rd_cnt + 1'b1;      
    end
end

//debug Pins
assign debugpin = {tx_en, adc_clk, dac_clk, okClk, dac_out[5], dac_out[4], dac_out[3], dac_out[2]};
function [7:0] dbg;
input [7:0] a;
integer i;
begin
for (i=0; i<8; i=i+1) begin: u
dbg[i] = a[i];
end
end
endfunction

assign m_dbg_signal=dbg(debugpin);

// Instantiate the okHost and connect endpoints.
wire [65*1-1:0]  okEHx;
okHost okHI(
    .okUH(okUH),
    .okHU(okHU),
    .okUHU(okUHU),
    .okAA(okAA),
    .okClk(okClk),
    .okHE(okHE),
    .okEH(okEH)
);

okWireOR # (.N(1)) wireOR (okEH, okEHx);

okTriggerIn trigIn53    (.okHE(okHE), .ep_addr(8'h40), .ep_clk(adc_data_clk), .ep_trigger(ep40trig));
okWireIn wire00         (.okHE(okHE), .ep_addr(8'h00), .ep_dataout(ep00data));
okWireIn wire01         (.okHE(okHE), .ep_addr(8'h01), .ep_dataout(ep01data));
okWireIn wire02         (.okHE(okHE), .ep_addr(8'h02), .ep_dataout(ep02data));
okPipeOut pipeOuta0     (.okHE(okHE), .okEH(okEHx[ 0*65 +: 65 ]), .ep_addr(8'ha0), .ep_read(ep_read), .ep_datain(pipea0_data));  
endmodule
`default_nettype wire