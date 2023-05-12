/*You are provided with a BCD one-digit adder named bcd_fadd that adds two BCD digits and carry-in, 
and produces a sum and carry-out.

module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input     cin,
    output   cout,
    output [3:0] sum );
Instantiate 100 copies of bcd_fadd to create a 100-digit BCD ripple-carry adder. 
Your adder should add two 100-digit BCD numbers (packed into 400-bit vectors) and a carry-in 
to produce a 100-digit sum and carry out.*/
module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    reg [400:0]carryout;
    assign carryout[0]=cin;
    reg [400:0]sumout;
    genvar i;
        generate

           
              for(i=0;i<=396;i=i+4)begin:name
                  bcd_fadd inst_i(a[i+3:i],b[i+3:i],carryout[i],carryout[i+4],sumout[i+3:i]);
                  
        end
        endgenerate
    assign sum=sumout;
    assign cout=carryout[400];
    
endmodule
