module top_module (
    input clk,
    input a,
    output q );
    always@(posedge clk)
        begin 
            if(a==0)
                q=1;
            else
                q=0;
        end
endmodule