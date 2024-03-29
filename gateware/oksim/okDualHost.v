//------------------------------------------------------------------------
// okDualHost.v
//
//  Description:
//    This file is a simulation replacement for okHost/okLibrary for
//    FrontPanel. It receives data from okHostCalls.v and
//    okHostCallsSecondary.v which are then restructured and timed
//    to communicate with the endpoint simulation modules.
//
//    This file is designed to simulate dual-fx3 devices.
//------------------------------------------------------------------------
// Copyright (c) 2022 Opal Kelly Incorporated
//------------------------------------------------------------------------

`default_nettype none
`timescale 1ns / 1ps

module okDualHost
	(
	input  wire [4:0]   okUH,
	output wire [2:0]   okHU,
	inout  wire [31:0]  okUHU,
	input  wire [4:0]   okUHs,
	output wire [2:0]   okHUs,
	inout  wire [31:0]  okUHUs,
	inout  wire         okAA,
	output wire         okClk,
	output wire [112:0] okHE,
	input  wire [64:0]  okEH,
	output wire         okClks,
	output wire [112:0] okHEs,
	input  wire [64:0]  okEHs,
	output reg          ok_done
	);

always @(*) begin
	ok_done <= 1'b1;
end

okHost host1(
	.okUH  (okUH),
	.okHU  (okHU),
	.okUHU (okUHU),
	.okAA  (okAA),
	.okClk (okClk),
	.okHE  (okHE),
	.okEH  (okEH)
);

okHost host2(
	.okUH  (okUHs),
	.okHU  (okHUs),
	.okUHU (okUHUs),
	.okAA  (),
	.okClk (okClks),
	.okHE  (okHEs),
	.okEH  (okEHs)
);

endmodule

`default_nettype wire