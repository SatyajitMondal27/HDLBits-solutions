/*Implement the following circuit:*/
module top_module (
    input clk,
    input in, 
    output out);
wire w1;
    xor g1(w1,in,out);
    always@(posedge clk)
        out<=w1;
endmodule