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
                next_state=b;
            else if(state==a && w==1)
                next_state=a;
            else if(state==b && w==0)
                next_state=c;
            else if(state==b && w==1)
                next_state=d;
            else if(state==c && w==0)
                next_state=e;
            else if(state==c && w==1)
                next_state=d;
            else if(state==d && w==0)
                next_state=f;
            else if(state==d && w==1)
                next_state=a;
            else if(state==e && w==0)
                next_state=e;
            else if(state==e && w==1)
                next_state=d;
            else if(state==f && w==0)
                next_state=c;
            else if(state==f && w==1)
                next_state=d;
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