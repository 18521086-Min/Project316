module conv2d_3x3 #(
    parameter SIZE  = 32 ,
    WEIGHT = 302,
    LENGHT = 302   
) (
    input clk,
    input reset_n,
    input load,
    input en,
    input [SIZE-1:0] in,
    input [SIZE-1:0] k1,
    input [SIZE-1:0] k2,
    input [SIZE-1:0] k3,
    input [SIZE-1:0] k4,
    input [SIZE-1:0] k5,
    input [SIZE-1:0] k6,
    input [SIZE-1:0] k7,
    input [SIZE-1:0] k8,
    input [SIZE-1:0] k9,
    output valid_out,
    output[SIZE-1:0] out
    
);  
    wire [SIZE-1:0] w1;
    wire [SIZE-1:0] w2;
    wire [SIZE-1:0] w3;
    wire [SIZE-1:0] w4;
    wire [SIZE-1:0] w5;
    wire [SIZE-1:0] w6;
    wire [SIZE-1:0] w7;
    wire [SIZE-1:0] w8;
    wire [SIZE-1:0] w9;
    
    line_buffer_3x3 #(.WEIGHT(WEIGHT)) lb
    (
        .clk(clk),
        .reset_n(reset_n),
        .en(en),
        .load(load),
        .in(in),
        .w1(w1),
        .w2(w2),
        .w3(w3),
        .w4(w4),
        .w5(w5),
        .w6(w6),
        .w7(w7),
        .w8(w8),
        .w9(w9)
    );

    conv2d_calculator conv2dd
    (   .clk(clk),
        .reset_n(reset_n),
        .en(en),
        .load(load),
        .w1(w1),
        .w2(w2),
        .w3(w3),
        .w4(w4),
        .w5(w5),
        .w6(w6),
        .w7(w7),
        .w8(w8),
        .w9(w9),
        .k1(k1),
        .k2(k2),
        .k3(k3),
        .k4(k4),
        .k5(k5),
        .k6(k6),
        .k7(k7),
        .k8(k8),
        .k9(k9),
        .valid_out(valid_out),
        .out(out)
    );
endmodule