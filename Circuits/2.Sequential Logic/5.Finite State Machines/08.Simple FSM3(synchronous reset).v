/*The following is the state transition table for a Moore state machine with one input, one output, and four states. Implement this state machine. Include a synchronous reset that resets the FSM to state A. (This is the same problem as Fsm3 but with a synchronous reset.)

State	Next state	Output
in=0	in=1
A	A	B	0
B	C	B	0
C	A	D	0
D	C	B	1
*/
module top_module(
    input clk,
    input in,
    input reset,
    output out); //

parameter A=4'b0001,B=4'b0010,C=4'b0100,D=4'b1000;
    reg [3:0]state=A;reg [3:0]next_state; 
    // State transition logic
    always@(posedge clk)
        begin
            if(reset)
                next_state=A;
            else if(state==A && in==0)
                begin
                    next_state=A;
                    
                end
            else if(state==A && in==1)
                begin
                next_state=B;
                    
                end
            else if(state==B && in==1)
                begin
                next_state=B;
                
                end
            else if(state==B && in==0)
                begin
                next_state=C;
                   
                end
            else if(state==C && in==1)
                begin
                next_state=D;
                     
                end
            else if(state==C && in==0)
                begin
                next_state=A;
                 
                end
            else if(state==D && in==1)
                begin
                next_state=B;
                    
                end
            else if(state==D && in==0)
                begin
                next_state=C;
                end
            state<=next_state;
         end
// State flip-flops with asynchronous reset
   
    // Output logic
    assign out=state[3];

endmodule