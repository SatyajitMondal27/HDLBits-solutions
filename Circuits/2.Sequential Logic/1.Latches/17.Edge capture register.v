/*For each bit in a 32-bit vector, capture when the input signal changes from 1 in one clock cycle to 0 the next. "Capture" means that the output will remain 1 until the register is reset (synchronous reset).

Each output bit behaves like a SR flip-flop: The output bit should be set (to 1) the cycle after a 1 to 0 transition occurs. The output bit should be reset (to 0) at the positive clock edge when reset is high. If both of the above events occur at the same time, reset has precedence. In the last 4 cycles of the example waveform below, the 'reset' event occurs one cycle earlier than the 'set' event, so there is no conflict here.

In the example waveform below, reset, in[1] and out[1] are shown again separately for clarity.*/
module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);
    reg [31:0]q; integer i;
    always@(posedge clk)
        begin
            if(reset==1)
                 out[31:0]<=32'b00000000000000000000000000000000;
            else if(reset==0)
                begin
           for(i=0;i<32;i=i+1)begin:name
            if(q[i]==1 && in[i]==0)
                out[i]<=1;
           end
        end
        end
    always@(posedge clk)
         q<=in;


endmodule