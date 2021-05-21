`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2021 10:16:59 PM
// Design Name: 
// Module Name: Adder
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
/*
cộng hai giá trị fixed
A , B ,C : fixed point
| 1 bit sign | 15 bit integer | 16 bit fraction |
*/

module Adder 
#(
parameter SIZE = 32
)
(   input  [SIZE-1:0] A,
    input  [SIZE-1:0] B,
    output [SIZE-1:0] Out
);

    wire [SIZE-2 : 0 ] Sub_AB;
    wire [SIZE-2 : 0 ] Sub_BA;
    wire [SIZE-2 : 0 ] Sum;
    
    assign Sub_AB = A[SIZE-2:0] - B[SIZE-2:0];
    assign Sub_BA = B[SIZE-2:0] - A[SIZE-2:0];
    assign Sum = A[SIZE-2:0] + B[SIZE-2:0];
    
    assign Out[SIZE-2 : 0] =  (A[SIZE-1]== B[SIZE-1]) ? Sum : ( (A[SIZE-2:0] >= B[SIZE-2 : 0]) ? Sub_AB : Sub_BA ) ;
    
    assign Out[SIZE-1] =  (A[SIZE-1] == B[SIZE-1]) ? A[SIZE-1] : ( (A[SIZE-2:0] >= B[SIZE-2:0]) ? A[SIZE-1] : B[SIZE-1] );
endmodule
