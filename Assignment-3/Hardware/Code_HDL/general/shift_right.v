`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2021 09:47:07 PM
// Design Name: 
// Module Name: shift_right
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

// Phep dich phai Fixed Point 
module shift_right
#(parameter SIZE = 32)
(
    
    input[SIZE-1:0]             In,
    //bit_shift la vi tri bit can shift
    input [$clog2(SIZE/2)-1:0]  Bit_shift,
    // Check gia tri co bang = 0 de xuat ra ket qua 
    input                       Check,
    output [SIZE-1:0]           Out
);
   
    assign Out[SIZE-2:0]=   Check ? (In[SIZE-2:0] >> (SIZE/2-Bit_shift)) : 0;
    assign Out[SIZE-1]  =   Check ? In[SIZE-1] : 0;
   
    
endmodule
