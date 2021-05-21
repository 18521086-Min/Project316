`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 12:43:25 PM
// Design Name: 
// Module Name: Max4In
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// Tim max trong 4 gia tri nhan vao
module Max4In 
#(parameter SIZE = 32)
(   
    input [SIZE-1:0] In1,
    input [SIZE-1:0] In2,
    input [SIZE-1:0] In3,
    input [SIZE-1:0] In4,
    output[SIZE-1:0] Out
    );
    //Day noi giua 2 max voi max cuoi
    wire [SIZE-1:0] Max_wire1;
    wire [SIZE-1:0] Max_wire2;


    Max2In max1(.A(In1),.B(In2),.Out(Max_wire1));
    Max2In max2(.A(In3),.B(In4),.Out(Max_wire2));

    Max2In max_out(.A(Max_wire1),.B(Max_wire2),.Out(Out));

endmodule
