/*Create a 100-bit binary ripple-carry adder by instantiating 100 full adders. The adder adds two 100-bit numbers and a carry-in to produce a 100-bit sum and carry out. To encourage you to actually instantiate full adders, also output the carry-out from each full adder in the ripple-carry adder.
 cout[99] is the final carry-out from the last full adder, 
 and is the carry-out you usually see.*/
 module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
 wire [99:0]carry;
    fa inst0(a[0],b[0],cin,sum[0],cout[0]);
    genvar i;
        generate
            for(i=1;i<100;i=i+1)begin:name
                fa inst_i(a[i],b[i],cout[i-1],sum[i],cout[i]);
        end
    endgenerate
endmodule

module fa(input a,b,c,output sum,carry);
    assign sum=a^b^c;
    assign carry= (a&b)|(a&c)|(b&c);
endmodule