/*Build a two-bit saturating counter.

The counter increments (up to a maximum of 3) when train_valid = 1 and train_taken = 1. It decrements (down to a minimum of 0) when train_valid = 1 and train_taken = 0. When not training (train_valid = 0), the counter keeps its value unchanged.

areset is an asynchronous reset that resets the counter to weakly not-taken (2'b01). Output state[1:0] is the two-bit counter value.*/
module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    reg [1:0]next_state;
    parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
    always@(*)
        begin
            if(train_valid==1 && train_taken==1 && state!=s3)
                next_state=state+1;
            else if(train_valid==1 && train_taken==1 && state==s3)
                next_state=state;
            else if(train_valid==1 && train_taken==0 && state!=s0)
                next_state=state-1;
            else if(train_valid==1 && train_taken==0 && state==s0)
                next_state=state;
            else if(!train_valid)
                next_state=state;
        end
            
                
    
    
    
    always@(posedge clk,posedge areset)
        begin
            if(areset)
                state<=s1;
            else
                state<=next_state;
        end

endmodule