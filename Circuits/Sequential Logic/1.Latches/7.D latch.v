/*Implement the following circuit:
Note that this is a latch, so a Quartus warning about having inferred a latch is expected.*/
module top_module (
    input d, 
    input ena,
    output q);
    always@(ena,d)
        begin
            if(ena==1'b1)
                q<=d;               
                
        end
endmodule
