/*Implement the circuit described by the Karnaugh map below.*/
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
assign out=a^b^c^d;
endmodule
