/*Given the state-assigned table shown below, implement the logic functions Y[0] and z.

Present state
y[2:0]	Next state Y[2:0]	Output z
x=0	x=1
000	000	001	0
001	001	100	0
010	010	001	0
011	001	010	1
100	011	100	1
*/

module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
parameter sa=3'b000,sb=3'b001,sc=3'b010,sd=3'b011,se=3'b100;
    reg [2:0]state,next_state;
    always@(*)
        begin       
            if(y==sa && x==0)
                next_state=sa;
            else if(y==sa && x==1)
                next_state=sb;
            else if(y==sb && x==0)
                next_state=sb;
            else if(y==sb && x==1)
                next_state=se;
            else if(y==sc && x==0)
                next_state=sc;
            else if(y==sc && x==1)
                next_state=sb;
            else if(y==sd && x==0)
                next_state=sb;
            else if(y==sd && x==1)
                next_state=sc;
            else if(y==se && x==0)
                next_state=sd;
            else if(y==se && x==1)
                next_state=se;          
            end
    always@(posedge clk)
        begin
            state<=next_state;
        end
    assign z= (~y[2]&y[1]&y[0]&~x)|(~y[2]&y[1]&y[0]&x)|(y[2]&~y[1]&~y[0]&~x)|(y[2]&~y[1]&~y[0]&x);
    assign Y0=next_state;   
endmodule