/*Implement the following circuit:*/
module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire w1,w2,w3;
    fa i1(x[0],y[0],0,sum[0],w1);
    fa i2(x[1],y[1],w1,sum[1],w2);
    fa i3(x[2],y[2],w2,sum[2],w3);
    fa i4(x[3],y[3],w3,sum[3],sum[4]);
endmodule
module fa(input a,b,cin, output sum,cout);
  assign sum = a^b^cin;
  assign cout = (a&b)|(b&cin)|(cin&a);
endmodule