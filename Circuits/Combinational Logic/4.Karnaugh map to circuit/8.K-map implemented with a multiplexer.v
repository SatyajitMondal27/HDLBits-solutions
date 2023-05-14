/*For the following Karnaugh map, give the circuit implementation using one 4-to-1 multiplexer and as many 2-to-1 multiplexers as required, 
but using as few as possible. You are not allowed to use any other logic gate and you must use a and b as the multiplexer selector inputs, 
as shown on the 4-to-1 multiplexer below.

You are implementing just the portion labelled top_module, 
such that the entire circuit (including the 4-to-1 mux) implements the K-map.*/
module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    assign mux_in[0]=d|c;
    assign mux_in[1]=0;
    assign mux_in[2]=~d;
    assign mux_in[3]=d&c;
            
endmodule
