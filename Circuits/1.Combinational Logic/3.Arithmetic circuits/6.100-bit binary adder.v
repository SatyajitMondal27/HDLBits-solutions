/*Create a 100-bit binary adder. 
The adder adds two 100-bit numbers and a carry-in to produce a 100-bit sum and carry out.*/
module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    reg [100:0]carryout;
    assign carryout[0]=cin;
        genvar i;
        generate
            for(i=0;i<100;i=i+1)begin:name
                fa inst_i(a[i],b[i],carryout[i],sum[i],carryout[i+1]);
        end
            assign cout=carryout[100];
    endgenerate

    
endmodule
module fa(input a,b,c,output sum,carry);
    assign sum=a^b^c;
    assign carry= (a&b)|(a&c)|(b&c);
endmodule