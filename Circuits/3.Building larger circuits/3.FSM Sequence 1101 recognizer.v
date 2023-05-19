/*This is the second component in a series of five exercises that builds a complex counter out of several smaller circuits. See the final exercise for the overall design.

Build a finite-state machine that searches for the sequence 1101 in an input bit stream. When the sequence is found, it should set start_shifting to 1, forever, until reset. Getting stuck in the final state is intended to model going to other states in a bigger FSM that is not yet implemented. We will be extending this FSM in the next few exercises.
*/
module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
    reg [2:0]state,next_state;
    always@(*)
        begin
            if(state==s0 && data==0)
                next_state=s0;
            else if(state==s0 && data==1)
                next_state=s1;
            else if(state==s1 && data==0)
                next_state=s0;
            else if(state==s1 && data==1)
                next_state=s2;
            else if(state==s2 && data==1)
                next_state=s2;
            else if(state==s2 && data==0)
                next_state=s3;
            else if(state==s3 && data==0)
                next_state=s1;
            else if(state==s3 && data==1)
                next_state=s4;
            else if(state==s4)
                next_state=s4;
        end
            
            
    
    always@(posedge clk)
        begin
            if(!reset)
                state<=next_state;
            else
                state<=s0;
        end
    assign start_shifting=state[2]&(~state[1])&(~state[0]);
endmodule