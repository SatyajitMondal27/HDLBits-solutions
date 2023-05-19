/*Given the state-assigned table shown below, implement the finite-state machine. Reset should reset the FSM to state 000.

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
    input reset,   // Synchronous reset
    input x,
    output z
);
parameter sa=3'b000,sb=3'b001,sc=3'b010,sd=3'b011,se=3'b100;
    reg [2:0]state,next_state;
    always@(*)
        begin       
            if(state==sa && x==0)
                next_state=sa;
            else if(state==sa && x==1)
                next_state=sb;
            else if(state==sb && x==0)
                next_state=sb;
            else if(state==sb && x==1)
                next_state=se;
            else if(state==sc && x==0)
                next_state=sc;
            else if(state==sc && x==1)
                next_state=sb;
            else if(state==sd && x==0)
                next_state=sb;
            else if(state==sd && x==1)
                next_state=sc;
            else if(state==se && x==0)
                next_state=sd;
            else if(state==se && x==1)
                next_state=se;          
            end
    always@(posedge clk)
        begin
            if(reset)
                state=sa;
            else
                state<=next_state;
        end
    assign z= (~state[2]&state[1]&state[0]&~x)|(~state[2]&state[1]&state[0]&x)|(state[2]&~state[1]&~state[0]&~x)|(state[2]&~state[1]&~state[0]&x);
            
endmodule