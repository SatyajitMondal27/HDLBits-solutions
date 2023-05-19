/*A linear feedback shift register is a shift register usually with a few XOR gates to produce the next state of the shift register.
A Galois LFSR is one particular arrangement where bit positions with a "tap" are XORed with the output bit to produce its next value, 
while bit positions without a tap shift. 
If the taps positions are carefully chosen, the LFSR can be made to be "maximum-length". A maximum-length LFSR of n bits
cycles through 2n-1 states before repeating (the all-zero state is never reached).

The following diagram shows a 5-bit maximal-length Galois LFSR with taps
 at bit positions 5 and 3. (Tap positions are usually numbered starting from 1). Note that I drew the XOR gate at position 5 for consistency, 
 but one of the XOR gate inputs is 0.
Build this LFSR. The reset should reset the LFSR to 1.*/
module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 
    wire w1,w2,w3;
    supply0 gnd;
    assign w1=1'b0^q[0];
    dflip inst1(clk,w1,reset,q[4]);
    dflip inst2(clk,q[4],reset,q[3]);
    assign w2=q[3]^q[0];
    dflip inst3(clk,w2,reset,q[2]);
    dflip inst4(clk,q[2],reset,q[1]);
    dflip1 inst5(clk,q[1],reset,q[0]);
    
endmodule
module dflip(input clk,d,reset,output q);
    always@(posedge clk)
        begin
            if(!reset)
                q<=d;
            else
                q<=0;
        end
endmodule
module dflip1(input clk,d,reset,output q);
    always@(posedge clk)
        begin
            if(!reset)
                q<=d;
            else
                q<=1;
        end
endmodule