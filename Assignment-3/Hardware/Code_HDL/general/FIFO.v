// Time May 14 2021 13:13
//
`timescale 1ns / 1ps

module FIFO #(
    parameter WIDTH = 32,
    parameter DEPTH = 32
)(
    input wire clk,
    input wire write,
    input wire read,
    input wire [WIDTH-1:0] data_in,
    output wire fifo_full,
    output wire fifo_empty,
    output reg [WIDTH-1:0] data_out
);

    // memory will contain the FIFO data.
    reg [WIDTH-1:0] memory [0:DEPTH-1];
    // $clog2(DEPTH+1)-2 to count from 0 to DEPTH
    reg [$clog2(DEPTH)-1:0] write_ptr;
    reg [$clog2(DEPTH)-1:0] read_ptr;
    reg [$clog2(DEPTH):0] counter_reg;
    reg flag_wr,flag_rd;

    // Initialization
    initial begin
    
        // Init both write_cnt and read_cnt to 0
        write_ptr = 0;
        read_ptr = 0;
	    counter_reg  = 0;
	    flag_wr = 0 ;
	    flag_rd = 0;

        // Display error if WIDTH is 0 or less.
        if ( WIDTH <= 0 ) begin
            $error("%m ** Illegal condition **, you used %d WIDTH", WIDTH);
        end
        // Display error if DEPTH is 0 or less.
        if ( DEPTH <= 0) begin
            $error("%m ** Illegal condition **, you used %d DEPTH", DEPTH);
        end

    end // end initial

    assign fifo_empty   = ( write_ptr == read_ptr ) ? 1'b1 : 1'b0;
    assign fifo_full    = ( counter_reg == DEPTH-1  ) ? 1'b1 : 1'b0;

    always @ (negedge clk) begin
        if ( write ) begin
            memory[write_ptr] = data_in;
	    flag_wr = 1;
        end

    end

    always @ ( posedge clk ) begin
        if ( write && flag_wr ) begin
            write_ptr = write_ptr + 1;
            counter_reg = counter_reg + 1;
        end
	//------------------------
	if ( read && ~fifo_empty && flag_rd) begin
            read_ptr = read_ptr + 1;
	    counter_reg = counter_reg - 1;
        end
	//------------------------
        if (read) begin
            data_out = memory[read_ptr];
	    flag_rd = 1;
	    memory[read_ptr] = 32'bz;
      	end else 
	    data_out = 32'bz;
    end
endmodule
