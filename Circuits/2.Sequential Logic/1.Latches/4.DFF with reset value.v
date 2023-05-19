/*Create 8 D flip-flops with active high synchronous reset. 
The flip-flops must be reset to 0x34 rather than zero. All DFFs should be triggered by the negative edge of clk.*/
module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);
    always@(negedge clk)
        begin
            q[7:0]<=d[7:0];
            if(reset==1)
                q[7:0]<=8'b00110100;
        end
endmodule

