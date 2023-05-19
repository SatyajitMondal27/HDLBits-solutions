module top_module (
    input clk,
    input a,
    output [3:0] q );
    always@(posedge clk)
        begin 
            if(a)
                q<=4;
            else if(q==0)
                q<=1;
            else if(q==1)
                q<=2;
            else if(q==2)
                q<=3;
            else if(q==3)
                q<=4;
            else if(q==4)
                q<=5;
            else if(q==5)
                q<=6;
            else if(q==6)
                q<=0;
        end
endmodule