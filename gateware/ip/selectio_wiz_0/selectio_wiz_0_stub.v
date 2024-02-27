// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Nov 21 17:24:42 2023
// Host        : BOOK-07G3AHJS47 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Projects/2023/Single_Tx_Rx_System/3_dac_adc_triggered_read/gateware/ip/selectio_wiz_0/selectio_wiz_0_stub.v
// Design      : selectio_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a75tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module selectio_wiz_0(data_out_from_device, data_out_to_pins, 
  clk_in, io_reset)
/* synthesis syn_black_box black_box_pad_pin="data_out_from_device[23:0],data_out_to_pins[11:0],io_reset" */
/* synthesis syn_force_seq_prim="clk_in" */;
  input [23:0]data_out_from_device;
  output [11:0]data_out_to_pins;
  input clk_in /* synthesis syn_isclock = 1 */;
  input io_reset;
endmodule
