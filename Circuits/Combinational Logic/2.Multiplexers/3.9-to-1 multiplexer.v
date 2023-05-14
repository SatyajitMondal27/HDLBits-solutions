/*Create a 16-bit wide, 9-to-1 multiplexer. sel=0 chooses a, sel=1 chooses b, etc. 
For the unused cases (sel=9 to 15), set all output bits to '1'.*/
module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );
    always@(sel)
        if(sel==0)
            out[15:0]=a[15:0];
    else if(sel==1)
        out[15:0]=b[15:0];
    else if(sel==2)
        out[15:0]=c[15:0];
    else if(sel==3)
        out[15:0]=d[15:0];
    else if(sel==4)
        out[15:0]=e[15:0];
    else if(sel==5)
        out[15:0]=f[15:0];
    else if(sel==6)
        out[15:0]=g[15:0];
    else if(sel==7)
        out[15:0]=h[15:0];
    else if(sel==8)
        out[15:0]=i[15:0];
    else
        out[15:0]=16'b1111111111111111;
endmodule