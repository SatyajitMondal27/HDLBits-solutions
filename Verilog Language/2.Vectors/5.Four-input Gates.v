/*Build a combinational circuit with four inputs, in[3:0].

There are 3 outputs:

out_and: output of a 4-input AND gate.
out_or: output of a 4-input OR gate.
out_xor: output of a 4-input XOR gate.
To review the AND, OR, and XOR operators, see andgate, norgate, and xnorgate.*/
module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    and g1(out_and,in[1],in[0],in[2],in[3]);
    or g2(out_or,in[1],in[0],in[2],in[3]);
    xor g3(out_xor,in[1],in[0],in[2],in[3]);
endmodule
