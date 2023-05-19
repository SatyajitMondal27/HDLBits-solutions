/*Make a decade counter that counts 1 through 10, inclusive. The reset input is synchronous, and should reset the counter to 1.*/
module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output reg[3:0] q);
        wire rst;
    tfpo one((~q[3]&q[1])|(~q[3]&q[0])|(~q[3]&q[2]&~q[1])|(q[3]&~q[2]&~q[1]),clk,reset|rst,q[0]);
    tfp two((~q[3]&q[0])|(~q[2]&~q[1]&q[0]),clk,reset|rst,q[1]);
    tfp three((q[0]&q[1]&~q[3]),clk,reset|rst,q[2]);
    tfp four((~q[3]&q[2]&q[1]&q[0])|(q[3]&q[2]&q[1]&~q[0]),clk,reset|rst,q[3]);
    assign rst=q[3]&~q[2]&q[1]&~q[0];
endmodule
module tfp(input t,clk,reset,output reg q);
    reg qn=1'b0;
    always@(posedge clk)
        begin
            if(!reset)
                begin
                if(t==1)
                qn=~qn;
                end
            else
                begin
                qn=1'b0;
                end
             q=qn;
        end
endmodule
module tfpo(input t,clk,reset,output reg q);
    reg qn=1'b1;
    always@(posedge clk)
        begin
            if(!reset)
                begin
                if(t==1)
                qn=~qn;
                end
            else
                begin
                qn=1'b1;
                end
             q=qn;
        end
endmodule