module shift_register_tb
#(
    parameter    SIZE = 32
)
();
    reg clk;
    reg reset_n;
    reg load;
    reg [SIZE -1 : 0 ] in;
    wire[SIZE -1 : 0 ] out; 

    integer i;
    localparam t = 20;

    initial begin
        clk = 0;
        reset_n = 0;
	load = 0;
        #(t*1.5);
	for(i=0;i<100;i=i+1) begin
	    reset_n = 1;
	    load = 1;
            in = $random;
	    #t;
 	end
	#t $stop;
    end
    always #(t/2) clk = ~clk;
    shift_register reg_tb
    (
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .in(in),
        .out(out)
    );
endmodule