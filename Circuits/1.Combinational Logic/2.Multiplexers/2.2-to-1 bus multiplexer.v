/*Create a 100-bit wide, 2-to-1 multiplexer. 
When sel=0, choose a. When sel=1, choose b.*/
module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );
    always@(sel)
        begin
            if(sel==0)
                out[99:0]=a[99:0];
            else
                out[99:0]=b[99:0];
        end
endmodule


