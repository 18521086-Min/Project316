/*
một ô nhớ 32bit 
luu lại gia trị ở cạnh lên xung clock và load = 1
reset về không nếu reset 1 -> 0
*/
module   register 
#(
    parameter SIZE = 32
)
(
    input clk,
    input reset_n,
     // load tin hieu cho phep luu lai
    input load,
    input [SIZE-1:0] in,
    output reg[SIZE-1:0] out
);
    always @(negedge reset_n, negedge clk) begin
        if(!reset_n) begin
            out = 32'b0;
        end else if (load) begin
            out = in;
        end
        
    end
endmodule