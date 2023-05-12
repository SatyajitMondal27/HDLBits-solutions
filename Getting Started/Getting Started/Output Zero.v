/*Build a circuit with no inputs and one output that outputs a constant 0

Now that you've worked through the previous problem, let's see if you can do a simple problem without the hints.*/
module top_module(
    output zero
);// Module body starts after semicolon
supply0 gnd;
    assign zero=gnd;
endmodule
