/*Taken from ECE253 2015 midterm question 5

Consider the sequential circuit below:
Assume that you want to implement hierarchical Verilog 
code for this circuit, using three instantiations of a submodule that has a flip-flop and multiplexer in it. Write a Verilog module (containing one
 flip-flop and multiplexer) named top_module for this submodule.*/
 module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    wire w1;
    always@(*)
        begin
            if(L==0)
                w1=q_in;
            else
                w1=r_in;
        end
    always@(posedge clk)
        begin
            Q<=w1;
        end

endmodule