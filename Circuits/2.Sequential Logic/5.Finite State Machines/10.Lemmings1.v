/*The game Lemmings involves critters with fairly simple brains. So simple that we are going to model it using a finite state machine.

In the Lemmings' 2D world, Lemmings can be in one of two states: walking left or walking right. It will switch directions if it hits an obstacle. In particular, if a Lemming is bumped on the left, it will walk right. If it's bumped on the right, it will walk left. If it's bumped on both sides at the same time, it will still switch directions.

Implement a Moore state machine with two states, two inputs, and one output that models this behaviour.*/
module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter left=0, right=1;
    reg state, next_state;

    always @(*) begin
        // State transition logic
        if(state==left && bump_left==0)
            next_state=left;
        else if(state==left && bump_left==1)
            next_state=right;
        else if(state==right && bump_right==0)
            next_state=right;
        else if(state==right && bump_right==1)
            next_state=left;
        
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
            state<=left;
        else
            state<=next_state;
        
        
    end

    // Output logic
     assign walk_left = ~state;
     assign walk_right = state;

endmodule