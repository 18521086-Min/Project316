`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2021 01:16:30 AM
// Design Name: 
// Module Name: line_buffer_2x2
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


module line_buffer_2x2
#( 
    parameter SIZE = 32,
    parameter WEIGHT = 10,
    parameter LENGTH = 10 
)
(
    input clk,
    input reset_n,
    input en,
    input load,
    input [SIZE - 1: 0] in,
    output[SIZE -1 : 0] w1,
    output[SIZE -1 : 0] w2,
    output[SIZE -1 : 0] w3,
    output[SIZE -1 : 0] w4

);
    wire [SIZE -1 : 0 ] wire_w1;
    wire [SIZE -1 : 0 ] wire_w2;
    wire [SIZE -1 : 0 ] wire_w3;
    wire [SIZE -1 : 0 ] wire_w4;

    register ww4
    (
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .in(in),
        .out(wire_w4)
    );
    register ww3
    (
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .in(wire_w4),
        .out(wire_w3)
    );
    shift_register #(.LENGHT(WEIGHT - 1)) ww2
    (
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .in(wire_w3),
        .out(wire_w2)
    );
    register ww1
    (
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .in(wire_w2),
        .out(wire_w1)
    );

    assign w1 = en ? wire_w1 : 32'bz;
    assign w2 = en ? wire_w2 : 32'bz;
    assign w3 = en ? wire_w3 : 32'bz;
    assign w4 = en ? wire_w4 : 32'bz;

endmodule
// https://d3i71xaburhd42.cloudfront.net/b9c07e66e0fdcc23c6d9b6234159db8ca18b1f34/5-Figure2-1.png