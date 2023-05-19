/*This is a Moore state machine with two states, two inputs, and one output. Implement this state machine.

This exercise is the same as fsm2, but using synchronous reset.

Fsmjks.png*/
module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

always @(*) begin    // This is a combinational always block
        // State transition logic
    if (state==ON && k==1'b1)
            next_state=OFF;
    else if(state==ON && k==1'b0)
            next_state=ON;
    else if(state==OFF && j==1'b1)
            next_state=ON;
    else if(state==OFF && j==1'b0)
            next_state=OFF;
    end

    always @(posedge clk)
        begin 
        if(reset)
            begin
            state<=OFF;
            end          
        else 
            state<=next_state;
    end

    // Output logic
     assign out = state;
endmodule