/*Given four unsigned numbers, find the minimum. 
Unsigned numbers can be compared with standard comparison operators (a < b). 
Use the conditional operator to make two-way min circuits, then compose a few of them to 
create a 4-way min circuit.
 You'll probably want some wire vectors for the intermediate results.*/
 module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    wire [7:0]w1,w2,w3,w4;
    // assign intermediate_result1 = compare? true: false;
    assign w1=(a<b)?a:b;
    assign w2=(w1<c)?w1:c;
    assign w3=(w2<d)?w2:d;
    assign min=w3;
endmodule
