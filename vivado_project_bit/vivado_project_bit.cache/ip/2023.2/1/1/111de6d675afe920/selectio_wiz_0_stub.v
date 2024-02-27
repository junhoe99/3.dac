// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Feb 27 17:09:53 2024
// Host        : FIR running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ selectio_wiz_0_stub.v
// Design      : selectio_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a75tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(data_in_from_pins, data_in_to_device, clk_in, 
  io_reset)
/* synthesis syn_black_box black_box_pad_pin="data_in_from_pins[11:0],data_in_to_device[23:0],io_reset" */
/* synthesis syn_force_seq_prim="clk_in" */;
  input [11:0]data_in_from_pins;
  output [23:0]data_in_to_device;
  input clk_in /* synthesis syn_isclock = 1 */;
  input io_reset;
endmodule
