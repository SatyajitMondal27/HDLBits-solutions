/*Build a counter that counts from 0 to 999, inclusive, with a period of 1000 cycles. The reset input is synchronous, and should reset the counter to 0.*/
module top_module (
    input clk,
    input reset,
    output [9:0] q);
parameter limit=10'd999;

    always@(posedge clk)
        begin
            if(!reset && q!=limit)
                q<=q+1;
            else if(q==limit && !reset)
                q<=0;
            else
                q<=0;
        end
                
endmodule
