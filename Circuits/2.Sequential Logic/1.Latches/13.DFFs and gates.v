/*Given the finite state machine circuit as shown, assume that the D flip-flops are initially reset to zero before the machine begins.

Build this circuit.*/
module top_module (
    input clk,
    input x,
    output z
); 
wire x1,x2,x3;
    reg q1=1'b0,q2=1'b0,q3=1'b0;
    
    xor g1(x1,x,q1);
    dff mod1(x1,clk,q1);
    and g2(x2,x,~q2);
    dff mod2(x2,clk,q2,);
    or g3(x3,x,~q3);
    dff mod3(x3,clk,q3);
    nor (z,q1,q2,q3);
endmodule


module dff(input d,clk,output reg q);
    reg qbar=1'b1;
    always@(posedge clk)
        begin
        q<=d;
        qbar<=~q;
        end
    
endmodule