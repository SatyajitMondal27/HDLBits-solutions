/*Build a priority encoder for 8-bit inputs. 
Given an 8-bit vector, the output should report the first (least significant) 
bit in the vector that is 1. Report zero if the input vector has no bits that are high. 
For example, the input 8'b10010000 should output 3'd4, because bit[4] is first bit that is high.*/
module top_module (
    input [7:0] in,
    output reg [2:0] pos );
    always@(*)
        begin
        casex({in[7],in[6],in[5],in[4],in[3],in[2],in[1],in[0]})
            8'b00000000:pos=4'd0;
            8'bxxxxxxx1:pos=4'd0;
            8'bxxxxxx10:pos=4'd1;
            8'bxxxxx100:pos=4'd2;
            8'bxxxx1000:pos=4'd3;
            8'bxxx10000:pos=4'd4;
            8'bxx100000:pos=4'd5;
            8'bx1000000:pos=4'd6;
            8'b10000000:pos=4'd7;
        endcase
        end
            
            
endmodule