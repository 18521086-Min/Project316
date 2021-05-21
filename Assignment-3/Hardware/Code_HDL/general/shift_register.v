/*

*/
module shift_register 
#(
    parameter LENGHT = 32,
    localparam SIZE = 32 
)
(
    input clk,
    input reset_n,
    input load,
    input [SIZE -1 : 0 ] in,
    output[SIZE -1 : 0 ] out  
);
    
    // day noi tiep truyen du lieu gia cac register 
    wire [SIZE -1 : 0 ] flow[LENGHT - 1 : 0];
    genvar i;
    generate
        for(i = 0;i<LENGHT;i=i+1) begin : shift
            if( !i ) begin
                register regg_b
                (
                    .clk(clk),
                    .reset_n(reset_n),
                    .load(load),
                    .in(in),
                    .out(flow[i])
                );
            end
            else if (i  == LENGHT -1 ) begin
                register regg_l
                (
                    .clk(clk),
                    .reset_n(reset_n),
                    .load(load),
                    .in(flow[i-1]),
                    .out(out)
                );
            end else begin
                register regg
                (
                    .clk(clk),
                    .reset_n(reset_n),
                    .load(load),
                    .in(flow[i-1]),
                    .out(flow[i])
                );
            end
        end
    endgenerate
 
endmodule
/*
http://slideplayer.com/5106522/16/images/2/4-bit%20Shift%20register%20q3%20q2%20q1%20q0%20Data_in%20clk%20reset.jpg
*/