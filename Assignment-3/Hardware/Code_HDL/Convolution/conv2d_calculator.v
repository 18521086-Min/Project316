`timescale 1ns / 1ps


module conv2d_calculator 
#(
    parameter SIZE = 32
) 
(   
    input clk,
    input reset_n,
    input load,
    input  en,
    input  [SIZE-1:0] w1,
    input  [SIZE-1:0] w2,
    input  [SIZE-1:0] w3,    
    input  [SIZE-1:0] w4,
    input  [SIZE-1:0] w5,
    input  [SIZE-1:0] w6,
    input  [SIZE-1:0] w7,
    input  [SIZE-1:0] w8,
    input  [SIZE-1:0] w9,
    //-------------------------
    input  [SIZE-1:0] k1,
    input  [SIZE-1:0] k2,
    input  [SIZE-1:0] k3,
    input  [SIZE-1:0] k4,
    input  [SIZE-1:0] k5,
    input  [SIZE-1:0] k6,
    input  [SIZE-1:0] k7,
    input  [SIZE-1:0] k8,
    input  [SIZE-1:0] k9,
    output            valid_out,
    output [SIZE-1:0] out
);
    wire [SIZE-1:0] w [8:0];
    wire [SIZE-1:0] k [8:0];
    
    assign w[0] = w1;
    assign w[1] = w2;
    assign w[2] = w3;
    assign w[3] = w4;
    assign w[4] = w5;
    assign w[5] = w6;
    assign w[6] = w7;
    assign w[7] = w8;
    assign w[8] = w9;
    //---------------//
    assign k[0] = k1;
    assign k[1] = k2;
    assign k[2] = k3;
    assign k[3] = k4;
    assign k[4] = k5;
    assign k[5] = k6;
    assign k[6] = k7;
    assign k[7] = k8;
    assign k[8] = k9;

    wire [SIZE-1:0] Mul_w  [SIZE/2-1:0];
    wire [SIZE-1:0] add_w2 [SIZE/4-1:0];
    wire [SIZE-1:0] add_w3 [SIZE/8-1:0];
    wire [SIZE-1:0] add_w4;
    wire [SIZE-1:0] add_w5;
    
    
    wire [SIZE-1:0] Mul_ww  [SIZE/2-1:0];
    wire [SIZE-1:0] add_ww2 [SIZE/4-1:0];
    wire [SIZE-1:0] add_ww3 [SIZE/8-1:0];
    wire [SIZE-1:0] add_ww4;
    wire [SIZE-1:0] add_ww5;
    
    wire [SIZE-1:0] wire_mul_w9[4:0];
    
    genvar i;
    generate 
        for(i=0;i<8;i=i+1) begin
            Mul mul(.A(w[i]),.B(k[i]),.Out(Mul_ww[i]));
            register r(.clk(clk),.reset_n(reset_n),.load(load),.in(Mul_ww[i]),.out(Mul_w[i]));
            if( (i+1)%2 == 0 ) begin
                Adder add1(.A(Mul_w[i-1]),.B(Mul_w[i]),.Out(add_ww2[i/2]));
                register r1(.clk(clk),.reset_n(reset_n),.load(load),.in(add_ww2[i/2]),.out(add_w2[i/2]));
            end
            if( (i+1)%4 == 0 ) begin
                Adder add2(.A(add_w2[(i+1)/2-2]),.B(add_w2[(i+1)/2-1]),.Out(add_ww3[i/4]));
                register r2(.clk(clk),.reset_n(reset_n),.load(load),.in(add_ww3[i/4]),.out(add_w3[i/4]));
            end
            if( (i+1)%8 == 0 ) begin
                Adder add3(.A(add_w3[(i+1)/4-2]),.B(add_w3[(i+1)/4-1]),.Out(add_ww4));
                register r3(.clk(clk),.reset_n(reset_n),.load(load),.in(add_ww4),.out(add_w4));
            end
        end
    endgenerate 
    
    Mul mulw9(.A(w[8]),.B(k[8]),.Out(wire_mul_w9[0]));
    register r(.clk(clk),.reset_n(reset_n),.load(load),.in(wire_mul_w9[0]),.out(wire_mul_w9[1]));
    register r1(.clk(clk),.reset_n(reset_n),.load(load),.in(wire_mul_w9[1]),.out(wire_mul_w9[2]));
    register r2(.clk(clk),.reset_n(reset_n),.load(load),.in(wire_mul_w9[2]),.out(wire_mul_w9[3]));
    register r3(.clk(clk),.reset_n(reset_n),.load(load),.in(wire_mul_w9[3]),.out(wire_mul_w9[4]));
    
    wire  en1,en2,en3,en4,en5;
    
    register #(.SIZE(1)) r_en(.clk(clk),.reset_n(reset_n),.load(load),.in(en),.out(en1));
    register #(.SIZE(1)) r_en1(.clk(clk),.reset_n(reset_n),.load(load),.in(en1),.out(en2));
    register #(.SIZE(1)) r_en2(.clk(clk),.reset_n(reset_n),.load(load),.in(en2),.out(en3));
    register #(.SIZE(1)) r_en3(.clk(clk),.reset_n(reset_n),.load(load),.in(en3),.out(en4));
    register #(.SIZE(1)) r_en4(.clk(clk),.reset_n(reset_n),.load(load),.in(en4),.out(en5));
    
    
    
    Adder add4(.A(add_w4),.B(wire_mul_w9[4]),.Out(add_ww5));
    register r4(.clk(clk),.reset_n(reset_n),.load(load),.in(add_ww5),.out(add_w5));
    
    assign  out = en5 ? add_w5: 32'bz;
    assign  valid_out = en5 ? 1 : 0;
endmodule
