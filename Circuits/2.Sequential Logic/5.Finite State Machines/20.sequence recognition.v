/*Synchronous HDLC framing involves decoding a continuous bit stream of data to look for bit patterns that indicate the beginning and end of frames (packets). Seeing exactly 6 consecutive 1s (i.e., 01111110) is a "flag" that indicate frame boundaries. To avoid the data stream from accidentally containing "flags", the sender inserts a zero after every 5 consecutive 1s which the receiver must detect and discard. We also need to signal an error if there are 7 or more consecutive 1s.

Create a finite state machine to recognize these three sequences:

0111110: Signal a bit needs to be discarded (disc).
01111110: Flag the beginning/end of a frame (flag).
01111111...: Error (7 or more 1s) (err).
When the FSM is reset, it should be in a state that behaves as though the previous input were 0.

Here are some example sequences that illustrate the desired operation.*/
module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
parameter check=4'b0000,r1=4'b0001,r2=4'b0010,r3=4'b0011,r4=4'b0100,r5=4'b0101,r6=4'b0110,disca=4'b0111,flags=4'b1000,error=4'b1001;
    reg [3:0]state,next_state;
    always@(*)
        begin
            if(state==check && in==0)
                next_state=check;
            else if(state==check && in==1)
                next_state=r1;
            else if(state==r1 && in==0)
                next_state=check;
            else if(state==r1 && in==1)
                next_state=r2;
            else if(state==r2 && in==0)
                next_state=check;
            else if(state==r2 && in==1)
                next_state=r3;
            else if(state==r3 && in==0)
                next_state=check;
            else if(state==r3 && in==1)
                next_state=r4;
            else if(state==r4 && in==0)
                next_state=check;
            else if(state==r4 && in==1)
                next_state=r5;
            else if(state==r5 && in==0)
                next_state=disca;
            else if(state==r5 && in==1)
                next_state=r6;
            else if(state==r6 && in==0)
                next_state=flags;
            else if(state==r6 && in==1)
                next_state=error;
            else if(state==error && in==0)
                next_state=check;
            else if(state==error && in==1)
                next_state=error;
            else if(state==disca && in==0)
                next_state=check;
            else if(state==disca && in==1)
                next_state=r1;
            else if(state==flags && in==0)
                next_state=check;
            else if(state==flags && in==1)
                next_state=r1;
        end
    always@(posedge clk)
        begin
            if(reset)
                state<=check;
            else
                state<=next_state;
        end
    assign disc=(state==disca);
    assign flag=(state==flags);
    assign err=(state==error);
            
            
endmodule