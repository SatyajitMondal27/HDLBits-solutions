module top_module (input a, input b, input c, output out);//
    supply1 vcc;
wire w1;
    andgate inst1 ( w1, a, b, c, vcc, vcc);
    not inst2(out,w1);

endmodule