/*Implement the circuit described by the Karnaugh map below.*/
module top_module(
    input a,
    input b,
    input c,
    input d,
    output reg out  ); 
   
    always@(*)
        begin
            if(a==0&&b==0&&c==0&&d==0)
                out=d;
            else if(a==0&&b==0&&c==1)
                out=1'b1;
            else if(a==1&&c==0&&d==1)
                out=d;
            else if(a==1&&c==1)
                out=1'b1;
            else if(a==1&&c==0&&d==0)
                out=1'b1;
            else
                out=1'b0;
        end
            
endmodule