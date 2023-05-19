/*In addition to walking left and right, Lemmings will fall (and presumably go "aaah!") if the ground disappears underneath them.

In addition to walking left and right and changing direction when bumped, when ground=0, the Lemming will fall and say "aaah!". When the ground reappears (ground=1), the Lemming will resume walking in the same direction as before the fall. Being bumped while falling does not affect the walking direction, and being bumped in the same cycle as ground disappears (but not yet falling), or when the ground reappears while still falling, also does not affect the walking direction.

Build a finite state machine that models this behaviour.*/
module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    parameter left=2'b00, right=2'b01,falling = 2'b10;
    reg [1:0] state, next_state;
    reg [1:0]bfs;

    always @(*) begin
        // State transition logic
         if(state==left && bump_left==0 && ground==1)
            next_state=left;
         else if(state==left && bump_left==1 && ground==1)
            next_state=right;
         else if(state==right && bump_right==0 && ground==1)
            next_state=right;
         else if(state==right && bump_right==1 && ground==1)
            next_state=left;
         else if(state==left && ground==0)
            begin
                next_state=falling;
            end
        
         else if(state==right && ground==0)
            begin
                 next_state=falling;
                 
            end
      
        else if(state==falling && ground==1 )
            begin
                next_state=bfs;
            end
        
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
            state<=left;
        else
            begin
                if(state!=falling)
                     bfs=state;
            state<=next_state;
            end
        
        
        
    end

    // Output logic
    assign walk_left = (~state[0])&(~state[1]);
    assign walk_right = (state[0])&(~state[1]);
    assign aaah= ((~state[0])&(state[1]))|((state[0])&(state[1]));

endmodule