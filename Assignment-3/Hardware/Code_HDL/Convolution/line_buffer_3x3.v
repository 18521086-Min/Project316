`timescale 1ns/1ps
module line_buffer_3x3 
#(
    parameter SIZE = 32,
    parameter WEIGHT = 10
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
    output[SIZE -1 : 0] w4,
    output[SIZE -1 : 0] w5,
    output[SIZE -1 : 0] w6,
    output[SIZE -1 : 0] w7,
    output[SIZE -1 : 0] w8,
    output[SIZE -1 : 0] w9
);
    wire [SIZE -1 : 0 ] wire_w1;
    wire [SIZE -1 : 0 ] wire_w2;
    wire [SIZE -1 : 0 ] wire_w3;
    wire [SIZE -1 : 0 ] wire_w4;
    wire [SIZE -1 : 0 ] wire_w5;
    wire [SIZE -1 : 0 ] wire_w6;
    wire [SIZE -1 : 0 ] wire_w7;
    wire [SIZE -1 : 0 ] wire_w8;
    wire [SIZE -1 : 0 ] wire_w9;

    register ww9
    (
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .in(in),
        .out(wire_w9)
    );
    register ww8
    (
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .in(wire_w9),
        .out(wire_w8)
    );
    register ww7
    (
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .in(wire_w8),
        .out(wire_w7)
    );
    shift_register #(.LENGHT(WEIGHT - 2)) ww6
    (
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .in(wire_w7),
        .out(wire_w6)
    );
    register ww5
    (
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .in(wire_w6),
        .out(wire_w5)
    );
    register ww4
    (
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .in(wire_w5),
        .out(wire_w4)
    );
    shift_register #(.LENGHT(WEIGHT - 2)) ww3
    (
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .in(wire_w4),
        .out(wire_w3)
    );
    register ww2
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
    assign w5 = en ? wire_w5 : 32'bz;
    assign w6 = en ? wire_w6 : 32'bz;
    assign w7 = en ? wire_w7 : 32'bz;
    assign w8 = en ? wire_w8 : 32'bz;
    assign w9 = en ? wire_w9 : 32'bz;
    
endmodule
// https://d3i71xaburhd42.cloudfront.net/b9c07e66e0fdcc23c6d9b6234159db8ca18b1f34/5-Figure2-1.png