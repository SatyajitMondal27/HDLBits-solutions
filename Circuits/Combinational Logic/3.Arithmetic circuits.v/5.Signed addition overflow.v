/*Assume that you have two 8-bit 2's complement numbers, a[7:0] and b[7:0]. These numbers are added to produce s[7:0]. 
Also compute whether a (signed) overflow has occurred.*/
module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
 
     assign s = a+b;
    always@(a[7],b[7],s[7])
        if(a[7]==0&&b[7]==0&&s[7]==1)
            overflow=1;
    else if(a[7]==1&&b[7]==1&&s[7]==0)
        overflow=1;
    else
        overflow=0;

endmodule