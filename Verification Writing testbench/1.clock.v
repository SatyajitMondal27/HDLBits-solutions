module top_module ( );
    reg clk;
    dut uut(clk);
    initial begin
        clk=1'b0;
    end
    always #5 clk=~clk;
endmodule