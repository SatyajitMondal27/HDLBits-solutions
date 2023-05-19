/*Build a decade counter that counts from 0 through 9, inclusive, with a period of 10. The reset input is synchronous, and should reset the counter to 0. We want to be able to pause the counter rather than always incrementing every clock cycle, so the slowena input indicates when the counter should increment.*/
module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    supply1 vdd;
    wire rst;
    tfp one((~q[3])|(~q[2]&~q[1]),clk,slowena,reset|rst,q[0]);
    tfp two((~q[3]&q[0]),clk,slowena,reset|rst,q[1]);
    tfp three((q[0]&q[1]&~q[3]),clk,slowena,reset|rst,q[2]);
    tfp four((q[3]&~q[2]&~q[1]&q[0])|(~q[3]&q[2]&q[1]&q[0]),clk,slowena,reset|rst,q[3]);
    assign rst=q[3]&~q[2]&q[1]&~q[0];
endmodule
module tfp(input t,clk,slowena,reset,output reg q);
    reg qn=1'b0;
    always@(posedge clk)
        begin
            if(reset)
                begin
                qn=1'b0;
                end
            else if(!reset && slowena)
                begin
                if(t==1)
                qn=~qn;
                end
            else if(!slowena)
                qn=qn;
            
             q=qn;
        end
endmodule