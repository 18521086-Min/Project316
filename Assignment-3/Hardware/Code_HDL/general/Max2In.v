`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2021 11:11:23 PM
// Design Name: 
// Module Name: Max2In
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

//Tim max trong 2 gia tri nhan vao
module Max2In 
#(parameter SIZE = 32)
(   
    input [SIZE-1:0] A,
    input [SIZE-1:0] B,
    output[SIZE-1:0] Out
);
    wire Comp_AB;
    wire Comp_Sign;
    wire Sel;
    assign Comp_AB   =    (A > B) ? 1 : 0;
    assign Comp_Sign  = (A[SIZE-1]==0 && B[SIZE-1]==0) ? 1 : 0 ;
    
    assign Sel = (Comp_Sign && Comp_AB) ? 1 : ( (~(Comp_AB) && ~(Comp_Sign)) ? 1 : 0 );
    assign Out = (Sel) ? A : B ;
    
endmodule
