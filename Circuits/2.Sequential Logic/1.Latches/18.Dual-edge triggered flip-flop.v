/*You're familiar with flip-flops that are triggered on the positive edge of the clock, or negative edge of the clock. A dual-edge triggered flip-flop is triggered on both edges of the clock. However, FPGAs don't have dual-edge triggered flip-flops, and always @(posedge clk or negedge clk) is not accepted as a legal sensitivity list.

Build a circuit that functionally behaves like a dual-edge triggered flip-flop:
*/
module top_module (
    input clk,
    input d,
    output reg q
);
    wire w1,w2;
    pff one(clk,d,w1);
    nff two(clk,d,w2);
    always@(clk)
        begin
            if(clk==1)
            q<=w1;
            else if(clk==0)
            q<=w2;
        end
    
endmodule


module pff(input clk,d,output reg q);
    always@(posedge clk)
        begin
            q<=d;
        end
endmodule

module nff(input clk,d,output reg q);
    always@(negedge clk)
        begin
       
                q<=d;
        end
endmodule