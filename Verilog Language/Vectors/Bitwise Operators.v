/*Earlier, we mentioned that there are bitwise and logical versions of the various boolean operators 
(e.g., norgate). When using vectors, the distinction between the two operator types becomes important. 
A bitwise operation between two N-bit vectors replicates the operation 
for each bit of the vector and produces a N-bit output, while a logical operation treats the entire vector 
as a boolean value (true = non-zero, false = zero) and produces a 1-bit output.

Look at the simulation waveforms at how the bitwise-OR and logical-OR differ.*/
module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    
    assign out_or_bitwise[2:0]= {(a[2]|b[2]),(a[1]|b[1]),(a[0]|b[0])};
    or g1(out_or_logical,b[2],b[1],b[0],a[2],a[1],a[0]);
    assign out_not[5:0]={~b[2],~b[1],~b[0],~a[2],~a[1],~a[0]};
endmodule