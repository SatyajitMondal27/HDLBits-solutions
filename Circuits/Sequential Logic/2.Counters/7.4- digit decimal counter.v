/*Build a 4-digit BCD (binary-coded decimal) counter. Each decimal digit is encoded using 4 bits: q[3:0] is the ones digit, q[7:4] is the tens digit, etc. For digits [3:1], also output an enable signal indicating when each of the upper three digits should be incremented.

You may want to instantiate or modify some one-digit decade counters.*/
module top_module (
    input clk,
    input reset,//Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
	wire en1, en2, en3, en4;
	assign en1 = 1;
	assign en2 = (q[3:0] == 4'd9);
	assign en3 = (q[7:4] == 4'd9 && q[3:0] == 4'd9);
	assign en4 = (q[11:8] == 4'd9 && q[7:4] == 4'd9 && q[3:0] == 4'd9);
   //one
    count4 inst1_count4
    (
        .clk(clk),
        .reset(reset),
        .ena(en1),
        .q(q[3:0])
    );

   //ten 
    count4 inst2_count4
    (
        .clk(clk),
        .reset(reset),
        .ena(en2),
        .q(q[7:4])
    );

   //hundred
    count4 inst3_count4
    (
        .clk(clk),
        .reset(reset),
        .ena(en3),
        .q(q[11:8])
    );

   //thousand
    count4 inst4_count4
    (
        .clk(clk),
        .reset(reset),
        .ena(en4),
        .q(q[15:12])
    );

   //Used to indicate carry
    assign ena = {q[11:8] == 4'd9 && q[7:4] == 4'd9 && q[3:0] == 4'd9, q[7:4] == 4'd9 && q[3:0] == 4'd9, q[3:0] == 4'd9};

endmodule
module count4
(
    input clk,
    input reset,
    input ena,
    output reg[3:0] q
);

    always @ (posedge clk)
        begin
            if(reset)
                q <= 4'b0;
            else if (ena)
                begin
                    if(q == 4'd9) 
                        q <= 4'd0;
                    else
                        q <= q + 1'b1;
                end
        end

endmodule