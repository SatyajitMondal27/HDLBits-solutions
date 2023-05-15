/*For each bit in an 8-bit vector, detect when the input signal changes from one clock cycle to the next (detect any edge). 
The output bit should be set the cycle after a 0 to 1 transition occurs.

Here are some examples. For clarity, in[1] and anyedge[1] are shown separately*/
module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0]q;
    always@(posedge clk)
        begin
            if((q[0]==0 && in[0]==1) ||(q[0]==1 && in[0]==0))
                anyedge[0]<=1;
            else
                anyedge[0]<=0;
            if((q[1]==0 && in[1]==1) ||(q[1]==1 && in[1]==0))
                anyedge[1]<=1;
            else
                anyedge[1]<=0;
            if((q[2]==0 && in[2]==1) ||(q[2]==1 && in[2]==0))
                anyedge[2]<=1;
            else
                anyedge[2]<=0;
            if((q[3]==0 && in[3]==1) ||(q[3]==1 && in[3]==0))
                anyedge[3]<=1;
            else
                anyedge[3]<=0;
            if((q[4]==0 && in[4]==1) ||(q[4]==1 && in[4]==0))
                anyedge[4]<=1;
            else
                anyedge[4]<=0;
            if((q[5]==0 && in[5]==1) ||(q[5]==1 && in[5]==0))
                anyedge[5]<=1;
            else
                anyedge[5]<=0;
            if((q[6]==0 && in[6]==1) ||(q[6]==1 && in[6]==0))
                anyedge[6]<=1;
            else
                anyedge[6]<=0;
            if((q[7]==0 && in[7]==1) ||(q[7]==1 && in[7]==0))
                anyedge[7]<=1;
            else
                anyedge[7]<=0;
        end
    
    always@(posedge clk)
         q<=in;
    
endmodule