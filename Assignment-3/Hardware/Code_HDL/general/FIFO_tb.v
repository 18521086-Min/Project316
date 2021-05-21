`timescale 1ns/1ps

module FIFO_tb #(
    parameter SIZE = 32,
    parameter WIDTH = 32
) (
);
    reg [WIDTH-1:0] data_in;
    reg clk;
    reg write;
    reg read;
    wire [WIDTH-1:0] data_out;
    wire fifo_full;
    wire fifo_empty;

    localparam t = 20 ;

    initial begin
        clk = 0;
        write = 0;
        read = 0; 
    end

    integer i;

    initial begin
	    #(3.5*t);
        for (i = 0;i<SIZE ;i=i+1 ) begin
            
            data_in = $random;
	    write = 1;
            #t ;
        end
        for (i = 0;i<SIZE ;i = i+1 ) begin
            read = 1;
            write = 0 ;
            data_in = $random;
            #t;
        end
        for ( i=0 ;i<SIZE ;i=i+1 ) begin
            data_in = $random;
            read = $random;
            write = $random;
            #t;
        end
        #t $stop;
    end
    FIFO fifo(clk,write,read,data_in,fifo_full,fifo_empty,data_out);
    always #(t/2) clk = ~clk;
endmodule