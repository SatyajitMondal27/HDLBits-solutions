/*The PS/2 mouse protocol sends messages that are three bytes long. However, within a continuous byte stream, it's not obvious where messages start and end. The only indication is that the first byte of each three byte message always has bit[3]=1 (but bit[3] of the other two bytes may be 1 or 0 depending on data).

We want a finite state machine that will search for message boundaries when given an input byte stream. The algorithm we'll use is to discard bytes until we see one with bit[3]=1. We then assume that this is byte 1 of a message, and signal the receipt of a message once all 3 bytes have been received (done).

The FSM should signal done in the cycle immediately after the third byte of each message was successfully received.*/
module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
parameter s1=2'b00,s2=2'b01,s3=2'b10,s4=2'b11;
    reg [1:0]state;reg[1:0]next_state;
    // State transition logic (combinational)
    always@(*)
        begin
            if(state==s1 && in[3]==0)
                next_state=s1;
            else if(state==s1 && in[3]==1)
                next_state=s2;
            else if(state==s2)
                next_state=s3;
            else if(state==s3)
                next_state=s4;
            else if(state==s4 && in[3]==0)
                next_state=s1;
            else if(state==s4 && in[3]==1)
                next_state=s2;
        end
            

    // State flip-flops (sequential)
    always@(posedge clk)
        begin
            if(reset)
                state<=s1;
            else
                state<=next_state;
        end
 
    // Output logic
            assign done=state[0]&state[1];
endmodule