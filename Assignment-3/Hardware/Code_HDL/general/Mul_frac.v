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

// Phep nhan 2 so Pixed Point trong do 0<= B <= 1 , A thuoc N
module Mul_frac
#(parameter SIZE = 32)
(
    input [SIZE-1:0] A,
    input [SIZE-1:0] B,
    output [SIZE-1:0] Out
);
    wire [SIZE-1:0] Mul_w  [SIZE/2-1:0];
    wire [SIZE-1:0] Mul_w2 [SIZE/4-1:0];
    wire [SIZE-1:0] Mul_w3 [SIZE/8-1:0];
    wire [SIZE-1:0] Mul_w4 [SIZE/16-1:0];
    wire [SIZE-1:0] Mul_w5; 


    // shifter 
    genvar i;
    generate 
        for(i=0;i<(SIZE/2);i=i+1) begin
                shift_right sft(.In(A),.Bit_shift(i),.Check(B[i]),.Out(Mul_w[i]));
                if( (i+1)%2 == 0 ) 
                    Adder add1(.A(Mul_w[i-1]),.B(Mul_w[i]),.Out(Mul_w2[i/2]));
                if( (i+1)%4 == 0 )
                    Adder add2(.A(Mul_w2[(i+1)/2-2]),.B(Mul_w2[(i+1)/2-1]),.Out(Mul_w3[i/4]));
                if( (i+1)%8 == 0 )
                    Adder add3(.A(Mul_w3[(i+1)/4-2]),.B(Mul_w3[(i+1)/4-1]),.Out(Mul_w4[i/8]));
                if( (i+1)%16 == 0 )
                    Adder add4(.A(Mul_w4[(i+1)/8-2]),.B(Mul_w4[(i+1)/8-1]),.Out(Mul_w5));
        end
    endgenerate
    
    assign Out = Mul_w5;

endmodule

//module gray2bin
//#(parameter SIZE = 8)
//(
//  input [SIZE-1:0] gray,
//  output [SIZE-1:0] bin
//)
//Genvar gi;
//// generate and endgenerate is optional
//// generate (optional)
//  for (gi=0; gi&lt;SIZE; gi=gi+1) begin : genbit
//    assign bin[gi] = ^gray[SIZE-1:gi]; // Thanks Dhruvkumar!
//  end
//// endgenerate (optional)
//endmodule
