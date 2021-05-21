`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2021 05:11:03 PM
// Design Name: 
// Module Name: max_pooling
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module max_pooling
#(
    parameter SIZE = 32,
    parameter LENGTH = 32 ,
    parameter WEIGHT = 32 
)
(   
    input clk,
    input reset_n,
    input en,
    input load,
    input [SIZE-1:0] in,
    output[SIZE-1:0] out
    


);

    wire [SIZE-1:0] wire_w1;
    wire [SIZE-1:0] wire_w2;
    wire [SIZE-1:0] wire_w3;
    wire [SIZE-1:0] wire_w4;
    wire [SIZE-1:0] wire_out;

    line_buffer_2x2 #(.WEIGHT(WEIGHT)) lb_2x2
    (
        .clk(clk),
        .reset_n(reset_n),
        .en(en),
        .load(load),
        .in(in),
        .w1(wire_w1),
        .w2(wire_w2),
        .w3(wire_w3),
        .w4(wire_w4)
    );

    Max4In max_4_in
    (
        .In1(wire_w1),
        .In2(wire_w2),
        .In3(wire_w3),
        .In4(wire_w4),
        .Out(wire_out)
    );

    assign out = en ? wire_out : 32'bz;



endmodule
