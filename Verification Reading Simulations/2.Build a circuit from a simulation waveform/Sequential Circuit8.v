module top_module (
    input clock,
    input a,
    output reg p,
    output reg q );
    always@(posedge clock)
        begin
            
            q<=q;
        end
    always@(negedge clock)
        begin
            
            q<=a;
        end
    always@(*)
        begin
            if(clock)
                p<=a;
            else
                p<=p;
        end
    
endmodule