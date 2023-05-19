/*Implement a Mealy-type finite state machine that recognizes the sequence "101" on an input signal named x. Your FSM should have an output signal, z, that is asserted to logic-1 when the "101" sequence is detected. Your FSM should also have an active-low asynchronous reset. You may only have 3 states in your state machine. Your FSM should recognize overlapping sequences.
*/
module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
parameter s0=2'b00,s1=2'b01,s2=2'b10;
    reg [1:0]state,next_state;
    always@(*)
        begin       
            if(state==s0 && x==0)
                next_state=s0;
            else if(state==s0 && x==1)
                next_state=s1;
            else if(state==s1 && x==0)
                next_state=s2;
            else if(state==s1 && x==1)
                next_state=s1;
            else if(state==s2 && x==0)
                next_state=s0;
            else if(state==s2 && x==1)
                next_state=s1;
        end
    always@(posedge clk,negedge aresetn)
        begin
            if(!aresetn)
                state=s0;
            else
                state<=next_state;
        end
    assign z= state[1]&(~state[0])&x;
            
endmodule