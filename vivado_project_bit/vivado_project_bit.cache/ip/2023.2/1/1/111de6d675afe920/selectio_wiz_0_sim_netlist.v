// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Feb 27 17:09:53 2024
// Host        : FIR running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ selectio_wiz_0_sim_netlist.v
// Design      : selectio_wiz_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a75tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* DEV_W = "24" *) (* SYS_W = "12" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (data_in_from_pins,
    data_in_to_device,
    clk_in,
    io_reset);
  input [11:0]data_in_from_pins;
  output [23:0]data_in_to_device;
  input clk_in;
  input io_reset;

  wire clk_in;
  (* IBUF_LOW_PWR *) (* IOSTANDARD = "LVCMOS33" *) wire [11:0]data_in_from_pins;
  wire [23:0]data_in_to_device;
  wire io_reset;

  (* DEV_W = "24" *) 
  (* SYS_W = "12" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_selectio_wiz_0_selectio_wiz inst
       (.clk_in(clk_in),
        .data_in_from_pins(data_in_from_pins),
        .data_in_to_device(data_in_to_device),
        .io_reset(io_reset));
endmodule

(* DEV_W = "24" *) (* SYS_W = "12" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_selectio_wiz_0_selectio_wiz
   (data_in_from_pins,
    data_in_to_device,
    clk_in,
    io_reset);
  input [11:0]data_in_from_pins;
  output [23:0]data_in_to_device;
  input clk_in;
  input io_reset;

  wire clk_in;
  wire [11:0]data_in_from_pins;
  wire [11:0]data_in_from_pins_int;
  wire [23:0]data_in_to_device;
  wire io_reset;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[0].ibuf_inst 
       (.I(data_in_from_pins[0]),
        .O(data_in_from_pins_int[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[0].iddr_inst 
       (.C(clk_in),
        .CE(1'b1),
        .D(data_in_from_pins_int[0]),
        .Q1(data_in_to_device[0]),
        .Q2(data_in_to_device[12]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[10].ibuf_inst 
       (.I(data_in_from_pins[10]),
        .O(data_in_from_pins_int[10]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[10].iddr_inst 
       (.C(clk_in),
        .CE(1'b1),
        .D(data_in_from_pins_int[10]),
        .Q1(data_in_to_device[10]),
        .Q2(data_in_to_device[22]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[11].ibuf_inst 
       (.I(data_in_from_pins[11]),
        .O(data_in_from_pins_int[11]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[11].iddr_inst 
       (.C(clk_in),
        .CE(1'b1),
        .D(data_in_from_pins_int[11]),
        .Q1(data_in_to_device[11]),
        .Q2(data_in_to_device[23]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[1].ibuf_inst 
       (.I(data_in_from_pins[1]),
        .O(data_in_from_pins_int[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[1].iddr_inst 
       (.C(clk_in),
        .CE(1'b1),
        .D(data_in_from_pins_int[1]),
        .Q1(data_in_to_device[1]),
        .Q2(data_in_to_device[13]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[2].ibuf_inst 
       (.I(data_in_from_pins[2]),
        .O(data_in_from_pins_int[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[2].iddr_inst 
       (.C(clk_in),
        .CE(1'b1),
        .D(data_in_from_pins_int[2]),
        .Q1(data_in_to_device[2]),
        .Q2(data_in_to_device[14]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[3].ibuf_inst 
       (.I(data_in_from_pins[3]),
        .O(data_in_from_pins_int[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[3].iddr_inst 
       (.C(clk_in),
        .CE(1'b1),
        .D(data_in_from_pins_int[3]),
        .Q1(data_in_to_device[3]),
        .Q2(data_in_to_device[15]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[4].ibuf_inst 
       (.I(data_in_from_pins[4]),
        .O(data_in_from_pins_int[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[4].iddr_inst 
       (.C(clk_in),
        .CE(1'b1),
        .D(data_in_from_pins_int[4]),
        .Q1(data_in_to_device[4]),
        .Q2(data_in_to_device[16]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[5].ibuf_inst 
       (.I(data_in_from_pins[5]),
        .O(data_in_from_pins_int[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[5].iddr_inst 
       (.C(clk_in),
        .CE(1'b1),
        .D(data_in_from_pins_int[5]),
        .Q1(data_in_to_device[5]),
        .Q2(data_in_to_device[17]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[6].ibuf_inst 
       (.I(data_in_from_pins[6]),
        .O(data_in_from_pins_int[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[6].iddr_inst 
       (.C(clk_in),
        .CE(1'b1),
        .D(data_in_from_pins_int[6]),
        .Q1(data_in_to_device[6]),
        .Q2(data_in_to_device[18]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[7].ibuf_inst 
       (.I(data_in_from_pins[7]),
        .O(data_in_from_pins_int[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[7].iddr_inst 
       (.C(clk_in),
        .CE(1'b1),
        .D(data_in_from_pins_int[7]),
        .Q1(data_in_to_device[7]),
        .Q2(data_in_to_device[19]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[8].ibuf_inst 
       (.I(data_in_from_pins[8]),
        .O(data_in_from_pins_int[8]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[8].iddr_inst 
       (.C(clk_in),
        .CE(1'b1),
        .D(data_in_from_pins_int[8]),
        .Q1(data_in_to_device[8]),
        .Q2(data_in_to_device[20]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[9].ibuf_inst 
       (.I(data_in_from_pins[9]),
        .O(data_in_from_pins_int[9]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[9].iddr_inst 
       (.C(clk_in),
        .CE(1'b1),
        .D(data_in_from_pins_int[9]),
        .Q1(data_in_to_device[9]),
        .Q2(data_in_to_device[21]),
        .R(io_reset),
        .S(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
