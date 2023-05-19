/*Row	Inputs	Outputs
number	x3	x2	x1	f
0	0	0	0	0
1	0	0	1	0
2	0	1	0	1
3	0	1	1	1
4	1	0	0	0
5	1	0	1	1
6	1	1	0	0
7	1	1	1	1
The above truth table is for a three-input, one-output function. 
It has 8 rows for each of the 8 possible input combinations, 
and one output column. 
There are four inputs combinations where the output is 1, 
and four where the output is 0.
Create a combinational circuit that implements the above truth table.*/
module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    or g1(f,(~x3&x2),(x3&x1));
endmodule
