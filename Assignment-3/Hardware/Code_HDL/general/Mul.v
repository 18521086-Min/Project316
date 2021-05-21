`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2021 02:33:35 PM
// Design Name: 
// Module Name: Mul
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
// Phep nhan 2 so Pixed Point trong do B , A thuoc N
module Mul
#(parameter SIZE = 32)
(
    input [SIZE-1:0] A,
    input [SIZE-1:0] B,
    output[SIZE-1:0] Out
); 
    wire [SIZE-1:0] wire_frac;
    wire [SIZE-1:0] wire_int;
    wire [SIZE-1:0] wire_out;
    
    Mul_int ngn(.A(A),.B(B),.Out(wire_frac));
    Mul_frac tp(.A(A),.B(B),.Out(wire_int));
    Adder add(.A(wire_frac),.B(wire_int),.Out(wire_out));
    
    assign Out[SIZE-2:0] = wire_out[SIZE-2:0];
    assign Out[SIZE-1] = (A[31] && B[31]) ? 0 : ((~A[31] && ~B[31]) ? 0 : 1); 

endmodule


