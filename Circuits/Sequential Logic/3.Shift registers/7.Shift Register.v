/*Implement the following circuit:

Exams m2014q4k.png*/
module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output reg out);
    reg q0,q1,q2;
    dfp inst1(clk,resetn,in,q0);
    dfp inst2(clk,resetn,q0,q1);
    dfp inst3(clk,resetn,q1,q2);
    dfp inst4(clk,resetn,q2,out);
    
endmodule
module dfp(input clk,resetn,d,output reg q);
     always@(posedge clk)
        begin
            if(!(~resetn))
            q=d;
            else if(~resetn)
                q=0;
        end
endmodule