/*Write complete Verilog code that represents this FSM. Use separate always blocks for the state table and the state flip-flops, as done in lectures. Describe the FSM output, which is called z, using either continuous assignment statement(s) or an always block (at your discretion). Assign any state codes that you wish to use.*/
module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
parameter a=3'b000,b=3'b001,c=3'b010,d=3'b011,e=3'b100,f=3'b101;
    reg [2:0]state,next_state;
    always@(*)
        begin
             if(state==a && w==0)
                next_state=a;
            else if(state==a && w==1)
                next_state=b;
            else if(state==b && w==0)
                next_state=d;
            else if(state==b && w==1)
                next_state=c;
            else if(state==c && w==0)
                next_state=d;
            else if(state==c && w==1)
                next_state=e;
            else if(state==d && w==0)
                next_state=a;
            else if(state==d && w==1)
                next_state=f;
            else if(state==e && w==0)
                next_state=d;
            else if(state==e && w==1)
                next_state=e;
            else if(state==f && w==0)
                next_state=d;
            else if(state==f && w==1)
                next_state=c;
        end
    always@(posedge clk)
        begin
            if(reset)
                state<=a;
            else
                state<=next_state;
        end
    assign z= (state==e)||(state==f);
            
            
endmodule