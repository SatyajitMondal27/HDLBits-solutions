/*Taken from 2015 midterm question 4

See mt2015_q4a and mt2015_q4b for the submodules used here. The top-level design consists of two i
nstantiations each of subcircuits A and B, as shown below.*/
module A(input x, input y, output z);
assign z=(x^y)&x;
endmodule

module B(input x, input y, output z);
assign z=~(x^y);
endmodule


module top_module (input x, input y, output z);
wire w1,w2,w3,w4,w5,w6;
    A ia1(x,y,w1);
    B ib1(x,y,w2);
    A ia2(x,y,w3);
    B ib2(x,y,w4);
    or g1(w5,w1,w2);
    and g2(w6,w3,w4);
    xor g3(z,w5,w6);
endmodule