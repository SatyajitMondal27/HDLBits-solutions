module top_module();
reg clk,in;
    reg [2:0]s;
    wire out;
    q7 uut(clk,in,s,out);
    initial begin
        clk=1'b0;
        in=1'b0;
        s=3'd2;
        #10;
        in=1'b0;
        s=3'd6;
        #10;
        in=1'b1;
        s=3'd2;
        #10;
        in=1'b0;
        s=3'd7;
        #10;
        in=1'b1;
        s=3'd0;
        #10;
        in=1'b1;
        s=3'd0;
        #10;
        in=1'b1;
        s=3'd0;
        #10;
        in=1'b0;
        s=3'd0;
        #10;
        
        
        
        
    end
    always #5 clk=~clk;
endmodule