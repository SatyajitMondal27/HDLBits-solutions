/*The following is the state transition table for a Moore state machine with one input, one output, and four states. Use the following state encoding: A=2'b00, B=2'b01, C=2'b10, D=2'b11.

Implement only the state transition logic and output logic (the combinational logic portion) for this state machine. Given the current state (state), compute the next_state and output (out) based on the state transition table.

State	Next state	Output
in=0	in=1
A	A	B	0
B	C	B	0
C	A	D	0
D	C	B	1
*/
module top_module(
    input in,
    input [1:0] state,
    output reg [1:0] next_state,
    output out); //
    
    
    
    parameter A=0, B=1, C=2, D=3;

    // State transition logic: next_state = f(state, in)
    always@(*)
        begin
            
            if(state==A && in==0)
                begin
                    next_state=A;
                    out=0;
                end
            else if(state==A && in==1)
                begin
                next_state=B;
                    out=0;
                end
            else if(state==B && in==1)
                begin
                next_state=B;
                out=0;
                end
            else if(state==B && in==0)
                begin
                next_state=C;
                     out=0;
                end
            else if(state==C && in==1)
                begin
                next_state=D;
                     out=0;
                end
            else if(state==C && in==0)
                begin
                next_state=A;
                     out=0;
                end
            else if(state==D && in==1)
                begin
                next_state=B;
                    out=1;
                end
            
            else if(state==D && in==0)
                begin
                next_state=C;
                    out=1;
                end      
        end
endmodule