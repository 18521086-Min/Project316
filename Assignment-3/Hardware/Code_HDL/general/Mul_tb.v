`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2021 11:55:47 AM
// Design Name: 
// Module Name: Mul_tb
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
module Mul_tb
#(
    parameter LENGTH    = 100000,
    parameter SIZE      = 32,
    parameter t         = 5
)
(
    
);
    
    reg [SIZE-1:0] IN   [LENGTH-1:0];
    reg [SIZE-1:0] OUT  [LENGTH/2-1:0];
    reg [SIZE-1:0] A;
    reg [SIZE-1:0] B;
    wire [SIZE-1:0] C;
    reg En;
    
    initial begin
        $readmemb("F:/Chuyen_De_Vi_Mach_1/Convolution/Python/input/value_in_fixed.txt", IN);
    end
    
    integer i;
    initial begin
        
        for (i=0; i < LENGTH/2; i = i + 1) begin
	    En = 0;
            A = IN[2*i];
            B = IN[2*i+1];
            #t;
	    En =1;
	    #t;
        end
        $writememb("F:/Chuyen_De_Vi_Mach_1/Convolution/Python/output/value_out_fixed.txt", OUT);
        #t;
        $stop;
        
    end
    
    always @ (posedge En) begin
	OUT[i] = C;
    end

    Mul X( A, B, C);
    
endmodule
