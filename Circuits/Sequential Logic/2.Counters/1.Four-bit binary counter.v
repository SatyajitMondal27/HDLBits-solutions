/*Build a 4-bit binary counter that counts from 0 through 15, inclusive, with a period of 16. The reset input is synchronous, and should reset the counter to 0.*/
module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    supply1 vdd;
    tfp one(vdd,clk,reset,q[0]);
    tfp two(q[0],clk,reset,q[1]);
    tfp three(q[0]&q[1],clk,reset,q[2]);
    tfp four(q[0]&q[1]&q[2],clk,reset,q[3]);
endmodule
module tfp(input t,clk,reset,output reg q);
    reg qn=1'b0;
    always@(posedge clk)
        begin
            if(!reset)
                begin
                if(t==1)
                qn=~qn;
                end
            else
                begin
                qn=1'b0;
                end
             q=qn;
        end
endmodule