/*For each bit in an 8-bit vector, detect when the input signal changes from 0 in one clock cycle to 1 the next
 (similar to positive edge detection). The output bit should be set the cycle after a 0 to 1 transition occurs.

Here are some examples. For clarity, in[1] and pedge[1] are shown separately.*/
module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0]q;
    always@(posedge clk)
        begin
            if(q[0]==0 && in[0]==1)
                pedge[0]<=1;
            else
                pedge[0]<=0;
            if(q[1]==0 && in[1]==1)
                pedge[1]<=1;
            else
                pedge[1]<=0;
            if(q[2]==0 && in[2]==1)
                pedge[2]<=1;
            else
                pedge[2]<=0;
            if(q[3]==0 && in[3]==1)
                pedge[3]<=1;
            else
                pedge[3]<=0;
            if(q[4]==0 && in[4]==1)
                pedge[4]<=1;
            else
                pedge[4]<=0;
            if(q[5]==0 && in[5]==1)
                pedge[5]<=1;
            else
                pedge[5]<=0;
            if(q[6]==0 && in[6]==1)
                pedge[6]<=1;
            else
                pedge[6]<=0;
            if(q[7]==0 && in[7]==1)
                pedge[7]<=1;
            else
                pedge[7]<=0;
        end
    
    always@(posedge clk)
         q<=in;
    
endmodule