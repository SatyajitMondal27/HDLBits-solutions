/*aken from 2015 midterm question 5. See also the first part of this question: mt2015_muxdff

Mt2015 muxdff.png

Write the Verilog code for this sequential circuit (Submodules are ok, but the top-level must be named top_module).
 Assume that you are going to implement the circuit on the DE1-SoC board. Connect the R inputs to the SW switches, 
 connect Clock to KEY[0], and L to KEY[1].
 Connect the Q outputs to the red lights LEDR.
 */
module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    wire [2:0]r;
    wire l,clk;
    wire w1,w2,w3,w4;
    assign r[2:0]=SW[2:0];
    assign l=KEY[1];
    assign clk=KEY[0];
    
    twotoone one(l,LEDR[2],r[0],w1);
    dflip inst1(clk,w1,LEDR[0]);
    twotoone two(l,LEDR[0],r[1],w2);
    dflip inst2(clk,w2,LEDR[1]);
    assign w3=LEDR[1]^LEDR[2];
    twotoone three(l,w3,r[2],w4);
    dflip inst3(clk,w4,LEDR[2]);
    

endmodule
module dflip(input clk,d,output q);
    always@(posedge clk)
        begin
          q<=d;           
        end
endmodule
module twotoone(input s,in1,in2,output reg o);
    always@(*)
        begin
            if(s==0)
                o=in1;
            else
                o=in2;
        end
endmodule