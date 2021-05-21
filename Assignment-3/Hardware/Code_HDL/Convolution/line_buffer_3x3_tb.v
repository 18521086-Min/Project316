`timescale 1ns/1ps
module line_buffer_3x3_tb #(
    parameter WEIGHT = 302,
    parameter LENGTH = 302,
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
    wire [SIZE -1 : 0] w5;
    wire [SIZE -1 : 0] w6;
    wire [SIZE -1 : 0] w7;
    wire [SIZE -1 : 0] w8;
    wire [SIZE -1 : 0] w9;
    reg [SIZE-1:0] memory [LENGTH*WEIGHT-1:0];
    reg [SIZE-1:0] reg_out [((LENGTH-2)*(WEIGHT-2))*9-1:0];
    reg flag;
    reg [$clog2(LENGTH*WEIGHT):0] counter;
    localparam t = 10;
    initial begin
        $readmemb("/home/min/Desktop/Convolution/Python/input/img_value_fixed_cv_lb.txt",memory);
	    counter = 0 ;
        en = 0;
    end
    
    integer i;
    initial begin
        clk = 1 ;
        reset_n = 0;
        load = 0;
        #t;
        for(i=0;i<=LENGTH*WEIGHT+1;i=i+1) begin
            flag = 0;
            if(i>LENGTH*2+2) begin
                if(i%LENGTH>2 || i%LENGTH==0) begin
                    counter = counter + 1;
                    en = 1;
                end
                else 
                    en = 0;
            end
            reset_n = 1;
            load = 1;
            in = memory[i];
	        flag = 1;
            #t;
        end
        #t;
            $writememb("/home/min/Desktop/Convolution/Python/output/img_value_out_fixed_lb.txt",reg_out);
        #t $stop;
    end
    always #(t/2) clk = ~clk;

    always @(posedge clk) begin
        if(flag && counter > 0 && en==1 ) begin
            reg_out[(counter-1)*9] = w1;
            reg_out[(counter-1)*9+1] = w2;
            reg_out[(counter-1)*9+2] = w3;
            reg_out[(counter-1)*9+3] = w4;
            reg_out[(counter-1)*9+4] = w5;
            reg_out[(counter-1)*9+5] = w6;
            reg_out[(counter-1)*9+6] = w7;
            reg_out[(counter-1)*9+7] = w8;
            reg_out[(counter-1)*9+8] = w9;
        end
    end
    
    line_buffer_3x3 #(.WEIGHT(WEIGHT)) lb(clk,reset_n,en,load,in,w1,w2,w3,w4,w5,w6,w7,w8,w9);
endmodule