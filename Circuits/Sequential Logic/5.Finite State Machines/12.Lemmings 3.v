/*In addition to walking and falling, Lemmings can sometimes be told to do useful things, like dig (it starts digging when dig=1). A Lemming can dig if it is currently walking on ground (ground=1 and not falling), and will continue digging until it reaches the other side (ground=0). At that point, since there is no ground, it will fall (aaah!), then continue walking in its original direction once it hits ground again. As with falling, being bumped while digging has no effect, and being told to dig when falling or when there is no ground is ignored.

(In other words, a walking Lemming can fall, dig, or switch directions. If more than one of these conditions are satisfied, fall has higher precedence than dig, which has higher precedence than switching directions.)

Extend your finite state machine to model this behaviour.*/


module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    reg [2:0]state,next_state;
    parameter wleft=3'b000;
    parameter wright=3'b001;
    parameter fleft=3'b010;
    parameter fright=3'b011;
    parameter dleft=3'b100;
    parameter dright=3'b101;
    
    always@(*)
        begin
            if(state==wleft && dig==1 && ground==1)
                next_state=dleft;
            else if(state==wleft && ground==0)
                next_state=fleft;
            else if(state==wleft && bump_left==1)
                next_state=wright;
            else if(state==wleft && bump_left==0)
                next_state=wleft;
            else if(state==wright && dig==1 && ground==1)
                next_state=dright;
            else if(state==wright && ground==0)
                next_state=fright;
            else if(state==wright && bump_right==1)
                next_state=wleft;
            else if(state==wright && bump_right==0)
                next_state=wright;
            else if(state==dleft && ground==1)
                next_state=dleft;
            else if(state==dleft && ground==0)
                next_state=fleft;
            else if(state==dright && ground==1)
                next_state=dright;
            else if(state==dright && ground==0)
                next_state=fright;
            else if(state==fleft && ground==0)
                next_state=fleft;
            else if(state==fleft && ground==1)
                next_state=wleft;
            else if(state==fright && ground==0)
                next_state=fright;
            else if(state==fright && ground==1)
                next_state=wright;
        end
    always@(posedge clk,posedge areset)
        begin
            if(areset)
                state=wleft;
            else
                state<=next_state;
        end
    assign walk_left=(state==wleft);
    assign walk_right=(state==wright);
    assign aaah=(state==fleft || state==fright);
    assign digging=(state==dleft || state==dright);
    
endmodule