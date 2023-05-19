/*A JK flip-flop has the below truth table. 
Implement a JK flip-flop with only a D-type flip-flop and gates. 
Note: Qold is the output of the D flip-flop before the positive clock edge.

J	K	Q
0	0	Qold
0	1	0
1	0	1
1	1	~Qold
*/
module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    always@(posedge clk)
        begin
            if(j==1'b0 && k==1'b0)
              begin
                  Q<=Q;
              end
            else if(j==1'b0 && k==1'b1)
                Q<=0;
            else if(j==1'b1 && k==1'b0)
                Q<=1;
            else
                Q<=~Q;
        end
endmodule