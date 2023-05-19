/*In many (older) serial communications protocols, each data byte is sent along with a start bit and a stop bit, to help the receiver delimit bytes from the stream of bits. One common scheme is to use one start bit (0), 8 data bits, and 1 stop bit (1). The line is also at logic 1 when nothing is being transmitted (idle).

Design a finite state machine that will identify when bytes have been correctly received when given a stream of bits. It needs to identify the start bit, wait for all 8 data bits, then verify that the stop bit was correct. If the stop bit does not appear when expected, the FSM must wait until it finds a stop bit before attempting to receive the next byte.*/
module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter [3:0] IDLE  = 4'd0;
    parameter [3:0] START = 4'd1;
    parameter [3:0] BIT1  = 4'd2;
    parameter [3:0] BIT2  = 4'd3;
    parameter [3:0] BIT3  = 4'd4;
    parameter [3:0] BIT4  = 4'd5;
    parameter [3:0] BIT5  = 4'd6;
    parameter [3:0] BIT6  = 4'd7;
    parameter [3:0] BIT7  = 4'd8;
    parameter [3:0] BIT8  = 4'd9;
    parameter [3:0] STOP  = 4'd10;
    parameter [3:0] ERROR  = 4'd11;
    reg [3:0] state,nstate;
    
    always @(posedge clk)begin
        if(reset)begin
            state <= IDLE;
        end
        else begin
           state <= nstate; 
        end
    end
    
    always @(*)begin
       nstate = IDLE;
        case(state)
            IDLE: nstate = in? IDLE:START;
            START:nstate = BIT1;
            BIT1: nstate = BIT2;
            BIT2: nstate = BIT3;
            BIT3: nstate = BIT4;
            BIT4: nstate = BIT5;
            BIT5: nstate = BIT6;
            BIT6: nstate = BIT7;
            BIT7: nstate = BIT8;
            BIT8: nstate = in? STOP:ERROR;
            STOP: nstate = in? IDLE:START;
            ERROR: nstate = in? IDLE:ERROR;
            default: nstate = IDLE;
        endcase
    end
    
    assign done = (state == STOP);
endmodule