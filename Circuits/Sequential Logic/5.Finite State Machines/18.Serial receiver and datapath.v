/*Now that you have a finite state machine that can identify when bytes are correctly received in a serial bitstream, add a datapath that will output the correctly-received data byte. out_byte needs to be valid when done is 1, and is don't-care otherwise.

Note that the serial protocol sends the least significant bit first.*/
module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //
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
    reg [7:0] data_r;
   
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

    always @(posedge clk)begin
        case(nstate)
            BIT1: data_r <= {in,data_r[7:1]};
            BIT2: data_r <= {in,data_r[7:1]};
            BIT3: data_r <= {in,data_r[7:1]};
            BIT4: data_r <= {in,data_r[7:1]};
            BIT5: data_r <= {in,data_r[7:1]};
            BIT6: data_r <= {in,data_r[7:1]};
            BIT7: data_r <= {in,data_r[7:1]};
            BIT8: data_r <= {in,data_r[7:1]}; 
        endcase
    end
   
    assign done = (state == STOP);
    assign out_byte = (state == STOP)? data_r:0;
endmodule