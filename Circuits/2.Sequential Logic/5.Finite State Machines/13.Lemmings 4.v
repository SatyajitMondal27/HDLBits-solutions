/*Although Lemmings can walk, fall, and dig, Lemmings aren't invulnerable. If a Lemming falls for too long then hits the ground, it can splatter. In particular, if a Lemming falls for more than 20 clock cycles then hits the ground, it will splatter and cease walking, falling, or digging (all 4 outputs become 0), forever (Or until the FSM gets reset). There is no upper limit on how far a Lemming can fall before hitting the ground. Lemmings only splatter when hitting the ground; they do not splatter in mid-air.

Extend your finite state machine to model this behaviour.

Falling for 20 cycles is survivable:*/
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
    parameter wleft=3'b000;    parameter wright=3'b001;    parameter fleft=3'b010;    parameter fright=3'b011;
    parameter dleft=3'b100;    parameter dright=3'b101;
    parameter dead=3'b110;
    integer falltime=0;
    
    always@(*)
        begin
            if(state==wleft && dig==1 && ground==1)
                next_state=dleft;
            else if(state==wleft && ground==0)
                begin
                next_state=fleft;
                 
                end
            else if(state==wleft && bump_left==1)
                next_state=wright;
            else if(state==wleft && bump_left==0)
                next_state=wleft;
            else if(state==wright && dig==1 && ground==1)
                next_state=dright;
            else if(state==wright && ground==0)
                begin
                next_state=fright;
             
                end
            else if(state==wright && bump_right==1)
                next_state=wleft;
            else if(state==wright && bump_right==0)
                next_state=wright;
            else if(state==dleft && ground==1)
                next_state=dleft;
            else if(state==dleft && ground==0)
                begin
                next_state=fleft;
                
                end
            else if(state==dright && ground==1)
                next_state=dright;
            else if(state==dright && ground==0)
                begin
                next_state=fright;
              
                end
            else if(state==fleft && ground==0)
                begin
                next_state=fleft;
              
                end
            else if(state==fleft && ground==1 && falltime<=20)
                begin
                next_state=wleft;
               
                end
            else if(state==fright && ground==0)
                begin
                next_state=fright;
             
                end
            else if(state==fright && ground==1 && falltime<=20)
                begin
                next_state=wright;
               
                end
            else if(state==fright && ground==1 && falltime>20)
                begin
                next_state=dead;
               
                end
            else if(state==fleft && ground==1 && falltime>20)
                begin
                next_state=dead;
               
                end
            else if(state==dead)
                begin
                next_state=dead;
                  
                end
        end
    always@(posedge clk,posedge areset)
        begin                  
            if(areset)
                begin
                state=wleft;   
                end
            else
                 state<=next_state;
        end
    always@(posedge clk)
        begin
            if(areset)
                falltime<=0;
            else if(!ground)
                falltime<=falltime+1;
            else
                falltime<=0;
        end
                
    assign walk_left=(state==wleft)&&(state!=dead);
    assign walk_right=(state==wright)&&(state!=dead);
    assign aaah=(state==fleft || state==fright)&&(state!=dead);
    assign digging=(state==dleft || state==dright)&&(state!=dead);
    
endmodule