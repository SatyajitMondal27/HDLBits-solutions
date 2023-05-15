/*Consider the n-bit shift register circuit shown below:
Write a Verilog module named top_module for one stage of this circuit, 
including both the flip-flop and multiplexers.*/
module top_module (
    input clk,
    input w, R, E, L,
    output reg Q
);
    wire w0,w1;
    always@(*)
        begin
            if(E==0)
                w0=Q;
            else
                w0=w;
        end
    always@(*)
        begin
            if(L==0)
                w1=w0;
            else
                w1=R;
        end
    always@(posedge clk)
        begin
            Q<=w1;
        end

endmodule