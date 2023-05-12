/*Case statements are more convenient than if statements if there are a large number of cases.
 So, in this exercise, create a 6-to-1 multiplexer. When sel is between 0 and 5, choose 
 the corresponding data input. Otherwise, output 0. The data inputs and outputs are all 4 bits wide.

Be careful of inferring latches (See.always_if2)*/
module top_module ( 
    input [2:0] sel, 
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out   );//

    always@(sel[0],sel[1],sel[2])
        begin  // This is a combinational circuit
        case(sel)
                3'b000:out[3:0]=data0[3:0];
                3'b001:out[3:0]=data1[3:0];
                3'b010:out[3:0]=data2[3:0];
                3'b011:out[3:0]=data3[3:0];
                3'b100:out[3:0]=data4[3:0];
                3'b101:out[3:0]=data5[3:0];
            default:out[3:0]=4'b0000;
                endcase
    end

endmodule