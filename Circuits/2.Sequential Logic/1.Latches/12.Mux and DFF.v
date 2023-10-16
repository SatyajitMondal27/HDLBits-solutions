/*Consider the n-bit shift register circuit shown below:
Write a Verilog module named top_module for one stage of this circuit, 
including both the flip-flop and multiplexers.*/
module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire w1,w2;
    mux one(Q,w,E,w1);
    mux two(w1,R,L,w2);
    dflip save(clk,w2,Q);
endmodule


module mux(input a,b,s,output o);
    always@(*)
        begin
            if(s==0)
                o=a;
            else
                o=b;
        end        
endmodule

module dflip(
    input clk,
    input d,   // synchronous reset
    output q);
    always@(posedge clk)
        begin
            if(clk==1)
                q<=d;
            else
                q<=q;
        end
endmodule
