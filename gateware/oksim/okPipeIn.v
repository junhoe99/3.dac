//------------------------------------------------------------------------
// okPipeIn.v
//
// This module simulates the "Input Pipe" endpoint.
//
//------------------------------------------------------------------------
// Copyright (c) 2005-2022 Opal Kelly Incorporated
// $Rev$ $Date$
//------------------------------------------------------------------------
`default_nettype none
`timescale 1ns / 1ps

module okPipeIn(
	input  wire [112:0] okHE,
	output wire [64:0]  okEH,
	input  wire [7:0]   ep_addr,
	output reg          ep_write,
	output reg  [31:0]  ep_dataout
	);

`include "parameters.vh" 
`include "mappings.vh"

assign okEH[okEH_DATAH:okEH_DATAL] = 0;
assign okEH[okEH_READY]            = (ti_addr == ep_addr) ? (1) : (0);
assign okEH[okEH_REGREADDATAH:okEH_REGREADDATAL] = 32'b0;

always @(posedge ti_clk) begin
	#TDOUT_DELAY;
	ep_write = 0;
	if (ti_reset == 1) begin
		ep_dataout  = 0;
	end else if ((ti_write == 1) && (ti_addr == ep_addr)) begin
		ep_dataout = ti_datain;
		ep_write = 1;
	end
end

initial begin
	if ((ep_addr < 8'h80) || (ep_addr > 8'h9F)) begin
		$error("okPipeIn endpoint address outside valid range, must be between 0x80 and 0x9F");
		$finish;
	end
end

endmodule

`default_nettype wire