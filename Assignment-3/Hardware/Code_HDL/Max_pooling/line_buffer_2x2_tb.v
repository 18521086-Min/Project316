`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2021 01:28:20 AM
// Design Name: 
// Module Name: line_buffer_2x2_tb
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


module line_buffer_2x2_tb
#(
    parameter WEIGHT = 10,
    parameter LENGTH = 10,
    parameter SIZE = 32 
)(
);
    reg clk;
    reg reset_n;
    reg en;
    reg load;
    reg  [SIZE - 1: 0] in;
    wire [SIZE -1 : 0] w1;
    wire [SIZE -1 : 0] w2;
    wire [SIZE -1 : 0] w3;
    wire [SIZE -1 : 0] w4;
    reg [SIZE-1:0] memory [LENGTH*WEIGHT-1:0];
    reg [SIZE-1:0] reg_out [((LENGTH/2)*(WEIGHT/2))*4-1:0];
    reg flag;
    reg [$clog2(LENGTH*WEIGHT):0] counter;
    reg [$clog2(LENGTH*WEIGHT):0] counter_w;
    reg [$clog2(LENGTH*WEIGHT):0] counter_l;
    localparam t = 10;
    initial begin
        $readmemb("/home/min/Desktop/Convolution/Python/input/img_value_in_fixed_lb.txt",memory);
	counter = 0 ;
        counter_w=0;
        counter_l=0;
        en = 0;
    end
    
    integer i;
    initial begin
        clk = 1 ;
        reset_n = 0;
        load = 0;
        #t;
        for(i=0;i<=LENGTH*WEIGHT;i=i+1) begin
            flag = 0;
            reset_n = 1;
            load = 1;
            in = memory[i];
	        flag = 1;
            #t;
            counter_l = counter_l+1;
        end
        #t;
            $writememb("/home/min/Desktop/Convolution/Python/output/value_fixed_line_buffer_2x2.txt",reg_out);
        #t $stop;
    end
    always #(t/2) clk = ~clk;

    always @(posedge clk) begin
        if(counter_l%2 ==1 && counter_w % 2 == 1 ) begin
                    counter = counter + 1;
                    en = 1;     
        end else begin
            en = 0;
        end
        if(counter_l == LENGTH) begin
            counter_l = 0;
	    counter_w = counter_w+1;
	end
        if(counter_w == WEIGHT)
            counter_w =0;
        
    end



    always @(negedge clk) begin
        if(flag && counter > 0 && en==1 ) begin
            #1 reg_out[(counter-1)*4] = w1;
             reg_out[(counter-1)*4+1] = w2;
             reg_out[(counter-1)*4+2] = w3;
             reg_out[(counter-1)*4+3] = w4;
        end
    end
    
    line_buffer_2x2 #(.WEIGHT(WEIGHT)) lb(clk,reset_n,en,load,in,w1,w2,w3,w4);
endmodule