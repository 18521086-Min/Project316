// Mach nhan mot so fixed voi phan nguyen // mach code tam
module Mul_int
#(parameter SIZE = 32)
(
    input [SIZE-1:0] A, // so nhan 
    input [SIZE-1:0] B, // so bi nhan
    output [SIZE-1:0] Out // gia tri output
);
    wire [SIZE-1:0] Mul_w  [SIZE/2-1:0];
    wire [SIZE-1:0] Mul_w2 [SIZE/4-1:0];
    wire [SIZE-1:0] Mul_w3 [SIZE/8-1:0];
    wire [SIZE-1:0] Mul_w4;


    // shifter 
    genvar i;
    generate 
        for(i=0;i<8;i=i+1) begin
                shift_left sl(.In(A),.Bit_shift(i+16),.Check(B[i+16]),.Out(Mul_w[i]));
                if( (i+1)%2 == 0 ) 
                    Adder add1(.A(Mul_w[i-1]),.B(Mul_w[i]),.Out(Mul_w2[i/2]));
                if( (i+1)%4 == 0 )
                    Adder add2(.A(Mul_w2[(i+1)/2-2]),.B(Mul_w2[(i+1)/2-1]),.Out(Mul_w3[i/4]));
                if( (i+1)%8 == 0 )
                    Adder add3(.A(Mul_w3[(i+1)/4-2]),.B(Mul_w3[(i+1)/4-1]),.Out(Mul_w4));
        end
    endgenerate
    
    assign Out = Mul_w4;


endmodule