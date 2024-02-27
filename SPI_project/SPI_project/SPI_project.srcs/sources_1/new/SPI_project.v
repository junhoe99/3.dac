`timescale 1ns / 1ps
module SPI_Project
(
input clk ,input reset,

input wire [7:0] data_in_to_master,
wire [7:0] data_out_from_master,

input wire [7:0] data_in_slave1,
input wire [7:0] data_in_slave2,
input wire [7:0] data_in_slave3,

wire [7:0] data_out_slave1,
wire [7:0] data_out_slave2,
wire [7:0] data_out_slave3,

input wire[1:0]CS,//has 4-states: 3 for the slaves and an idle state 
input    [1:0]RW, //Read-Write, //for TB only
input wire[1:0]MODE
);
wire MOSI;
wire MISO;
wire MISO1;
wire MISO2;
wire MISO3;

wire CS1bar;
wire CS2bar;
wire CS3bar;

wire sclk;
wire sreset;
wire[1:0]sMODE;
//internal modules
spi_master  MSTR
(
 .clk(clk),
 .reset(reset),

 .MODE(MODE),
 .MISO(MISO),
 .MOSI(MOSI),

 .sck(sck),
 .sreset(sreset),
 //.sMODE,

 .CS(CS),
 .RW(RW),

 .data_in(data_in_to_master),
 .data_out(data_out_from_master),

 .SS1bar(SS1ba),
 .SS2bar(SS2ba),
 .SS3bar(SS3ba)
);

slave SLV_1
(
.MODE(sMODE),
.data_in(data_in_slave1),
.reset(sreset),
.clk(sck),
.MOSI(MOSI),
.MISO(MISO1),
.SS(SS1bar),
.data_out(data_out_slave1)
);

slave SLV_2
(
.MODE(sMODE),
.data_in(data_in_slave2),
.reset(sreset),
.clk(sck),
.MOSI(MOSI),
.MISO(MISO2),
.SS(SS2bar),
.data_out(data_out_slave2)
);

slave SLV_3
(
.MODE(sMODE),
.data_in(data_in_slave3),
.reset(sreset),
.clk(sck),
.MOSI(MOSI),
.MISO(MISO3),
.SS(SS3bar),
.data_out(data_out_slave3)
);

assign MISO =(SS1bar==0)?MISO1:
             (SS2bar==0)?MISO2:
             (SS3bar==0)?MISO3:1'bx;

endmodule
