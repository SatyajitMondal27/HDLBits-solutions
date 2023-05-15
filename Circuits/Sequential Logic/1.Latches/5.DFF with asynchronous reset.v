/*Create 8 D flip-flops with active high asynchronous reset. All DFFs should be triggered by the positive edge of clk.*/
module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
    always@(posedge areset or posedge clk) begin
        if(areset)
            q<=8'b00000000;
        else
            q<=d;
    end
endmodule