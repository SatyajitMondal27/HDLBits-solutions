/*The following diagram is a Mealy machine implementation of the 2's complementer. Implement using one-hot encoding.*/
module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
parameter sa=1'b0,sb=1'b1;
    reg state,next_state;
    always@(*)
        begin       
            if(state==sa && x==0)
                next_state=sa;
            else if(state==sa && x==1)
                next_state=sb;
            else if(state==sb && x==0)
                next_state=sb;
            else if(state==sb && x==1)
                next_state=sb;
            end
    always@(posedge clk,posedge areset)
        begin
            if(areset)
                state=sa;
            else
                state<=next_state;
        end
    assign z= ((~state)&x)|(state&(~x));
            
endmodule