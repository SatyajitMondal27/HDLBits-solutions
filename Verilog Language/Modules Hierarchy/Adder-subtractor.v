/*An adder-subtractor can be built from an adder by optionally negating one of the inputs, 
which is equivalent to inverting the input then adding 1. 
The net result is a circuit that can do two operations: (a + b + 0) and (a + ~b + 1). 
See Wikipedia if you want a more detailed explanation of how this circuit works.

Build the adder-subtractor below.

You are provided with a 16-bit adder module, which you need to instantiate twice:

module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );

Use a 32-bit wide XOR gate to invert the b input whenever sub is 1. 
(This can also be viewed as b[31:0] XORed with sub replicated 32 times. See replication operator.). 
Also connect the sub input to the carry-in of the adder.*/
module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cout1,cout2;
    wire [31:0]w1;
    assign w1[31:0]={(b[31]^sub),(b[30]^sub),(b[29]^sub),(b[28]^sub),(b[27]^sub),(b[26]^sub),(b[25]^sub),(b[24]^sub),(b[23]^sub),(b[22]^sub),(b[21]^sub),(b[20]^sub),(b[19]^sub),(b[18]^sub),(b[17]^sub),(b[16]^sub),(b[15]^sub),(b[14]^sub),(b[13]^sub),(b[12]^sub),(b[11]^sub),(b[10]^sub),(b[9]^sub),(b[8]^sub),(b[7]^sub),(b[6]^sub),(b[5]^sub),(b[4]^sub),(b[3]^sub),(b[2]^sub),(b[1]^sub),(b[0]^sub)};
    add16 m1(a[15:0],w1[15:0],sub,sum[15:0],cout1);
    add16 m2(a[31:16],w1[31:16],cout1,sum[31:16],cout2);
endmodule
