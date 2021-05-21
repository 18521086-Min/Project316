`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2021 11:19:05 AM
// Design Name: 
// Module Name: conv2d_3_tb
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


module conv2d_calculator_tb
#(
    parameter SIZE = 32,
    parameter SIZE_IMG = 300*300*9 ,
    parameter SIZE_KER = 9

)
(

);

    reg  [SIZE-1:0] w1;
    reg  [SIZE-1:0] w2;
    reg  [SIZE-1:0] w3;    
    reg  [SIZE-1:0] w4;
    reg  [SIZE-1:0] w5;
    reg  [SIZE-1:0] w6;
    reg  [SIZE-1:0] w7;
    reg  [SIZE-1:0] w8;
    reg  [SIZE-1:0] w9;
    //-------------------------
    reg  [SIZE-1:0] k1;
    reg  [SIZE-1:0] k2;
    reg  [SIZE-1:0] k3;
    reg  [SIZE-1:0] k4;
    reg  [SIZE-1:0] k5;
    reg  [SIZE-1:0] k6;
    reg  [SIZE-1:0] k7;
    reg  [SIZE-1:0] k8;
    reg  [SIZE-1:0] k9;
    wire [SIZE-1:0] out;
    reg  [SIZE-1:0] memory [SIZE_IMG-1:0];
    reg  [SIZE-1:0] kernel [SIZE_KER-1:0];
    reg  [SIZE-1:0] conv   [SIZE_IMG/9-1:0];
    initial begin
        $readmemb("/home/min/Desktop/Convolution/Python/input/img_value_fixed_cv_no_lb.txt",memory);
        $readmemb("/home/min/Desktop/Convolution/Python/input/kernel_fixed.txt",kernel);
    end

    localparam t = 10 ;
    integer i;
    integer j;
    reg Flag;
    initial begin
        k1 = kernel[0];
        k2 = kernel[1];
        k3 = kernel[2]; 
        k4 = kernel[3];
        k5 = kernel[4];
        k6 = kernel[5];
        k7 = kernel[6];
        k8 = kernel[7];
        k9 = kernel[8];
        for(i = 0;i<(SIZE_IMG/9);i=i+1)begin
            Flag = 0;
            w1 = memory[i*9];
            w2 = memory[i*9+1];
            w3 = memory[i*9+2];
            w4 = memory[i*9+3];
            w5 = memory[i*9+4];
            w6 = memory[i*9+5];
            w7 = memory[i*9+6];
            w8 = memory[i*9+7];
            w9 = memory[i*9+8];
            #t Flag = 1;
            #t;
        end
        #t
        $writememb("/home/min/Desktop/Convolution/Python/output/img_value_out_fixed.txt",conv);
        #t $stop;

    end
    always @ (posedge Flag) begin
	conv[i] = out;
    end
    conv2d_calculator conv2dd(w1,w2,w3,w4,w5,w6,w7,w8,w9,k1,k2,k3,k4,k5,k6,k7,k8,k9,out);
endmodule
