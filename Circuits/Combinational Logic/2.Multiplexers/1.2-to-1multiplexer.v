/*Create a one-bit wide, 2-to-1 multiplexer. 
When sel=0, choose a. When sel=1, choose b.*/
module top_module( 
    input a, b, sel,
    output out ); 
    always@(sel)
        begin
            if(sel==1'b0)
                out=a;
            else
                out=b;
        end
endmodule
