`timescale 1ns/1ps
module conv2d_3x3_tb #(
    parameter WEIGHT = 302,
    parameter LENGTH = 302,
    parameter SIZE_KER = 9,
    parameter SIZE = 32
)(
);
    reg clk;
    reg reset_n;
    reg en;
    reg load;
    reg [SIZE - 1: 0] in;
    reg [SIZE -1 : 0] k1;
    reg [SIZE -1 : 0] k2;
    reg [SIZE -1 : 0] k3;
    reg [SIZE -1 : 0] k4;
    reg [SIZE -1 : 0] k5;
    reg [SIZE -1 : 0] k6;
    reg [SIZE -1 : 0] k7;
    reg [SIZE -1 : 0] k8;
    reg [SIZE -1 : 0] k9;
    wire              valid_out;
    wire[SIZE -1 : 0] out;


    reg [SIZE-1:0] memory [LENGTH*WEIGHT-1:0];
    reg [SIZE-1:0] reg_out [(LENGTH-2)*(WEIGHT-2)-1:0];
    reg [SIZE-1:0] kernel [SIZE_KER-1:0];
    reg flag;
    reg [$clog2(LENGTH*WEIGHT):0] counter;
    reg [$clog2(LENGTH):0] counter_l;
    reg [$clog2(WEIGHT):0] counter_w;

    reg done_img;
    
    localparam t = 10;
    initial begin
        $readmemb("/home/min/Desktop/Convolution/Python/input/img_value_fixed_cv_lb.txt",memory);
        $readmemb("/home/min/Desktop/Convolution/Python/input/kernel_fixed.txt",kernel);
	counter = 0 ;
	counter_l = 0;
	counter_w = 0;
    done_img = 0;
    en = 0;
    end
    
    integer i;
    initial begin
        clk = 1 ;
        reset_n = 0;
        load = 0;
        #t;
        k1 = kernel[0];
        k2 = kernel[1];
        k3 = kernel[2];
        k4 = kernel[3];
        k5 = kernel[4];
        k6 = kernel[5];
        k7 = kernel[6];
        k8 = kernel[7];
        k9 = kernel[8];
        for(i=0;i<LENGTH*WEIGHT;i=i+1) begin
            reset_n = 1;
            load = 1;
            in = memory[i];
            #t;
	    counter_l = counter_l+1;
        end
        #(7*t);
            $writememb("/home/min/Desktop/Convolution/Python/output/img_value_out_fixed_cv_lb.txt",reg_out);
        #t $stop;
    end
    always #(t/2) clk = ~clk;

    always @(posedge clk) begin
        if(counter_l == LENGTH) begin
            counter_l = 0;
            counter_w = counter_w+1;
        end
        if(counter_w == WEIGHT) begin
            counter_w = 0 ;
            done_img =  1;
        end
        if(counter_w==0 && counter_l == 0)
            #(t/1.8)en = 0;
        if(counter_w > 1 ) begin
            if(counter_l >1) begin
                #(t/1.8)en = 1;
            end
            else
                #(t/1.8)en = 0;
        end
    end
    always @(posedge clk) begin
        if( valid_out) begin
            counter = counter + 1;
           #1 reg_out[(counter-1)] = out;
        end
    end
    
    conv2d_3x3 #(.WEIGHT(WEIGHT)) conv3x3(clk,reset_n,load,en,in,k1,k2,k3,k4,k5,k6,k7,k8,k9,valid_out,out);
endmodule