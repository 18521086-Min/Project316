// Phep dich trai Fixed Point 
module shift_left
#(parameter SIZE = 32)
(
    input[SIZE-1:0] In,
    //bit_shift la vi tri bit can shift
    input [$clog2(SIZE)-1:0]  Bit_shift,
    // Check gia tri co bang = 0 de xuat ra ket qua 
    input Check,
    output [SIZE-1:0]Out
);
   
    assign Out[SIZE-2:0]=   Check ? (In[SIZE-2:0] << ( Bit_shift-(SIZE/2) ) ) : 0;
    assign Out[SIZE-1]  =   Check ? In[SIZE-1] : 0;
   
    
endmodule
