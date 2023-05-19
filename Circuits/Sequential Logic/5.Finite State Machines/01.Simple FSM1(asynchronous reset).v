/*This is a Moore state machine with two states, one input, and one output. Implement this state machine. Notice that the reset state is B.

This exercise is the same as fsm1s, but using asynchronous reset.

Fsm1.png
*/
module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        if (state==A && in==1'b1)
            next_state=A;
        else if(state==A && in==1'b0)
            next_state=B;
        else if(state==B && in==1'b1)
            next_state=B;
        else if(state==B && in==1'b0)
            next_state=A;
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if(areset)
            begin
            state<=B;
            end          
        else 
            state<=next_state;
    end

    // Output logic
     assign out = state;

endmodule