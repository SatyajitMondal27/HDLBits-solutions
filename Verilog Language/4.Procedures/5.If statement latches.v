/*The following code contains incorrect behaviour that creates a latch. 
Fix the bugs so that you will shut off the computer only if it's really overheated, 
and stop driving if you've arrived at your destination or you need to refuel.



always @(*) begin
    if (cpu_overheated)
       shut_off_computer = 1;
end

always @(*) begin
    if (~arrived)
       keep_driving = ~gas_tank_empty;
end
*/
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(cpu_overheated) 
        begin
        if (cpu_overheated>0)
           shut_off_computer = 1'b1;
        else
            shut_off_computer = 1'b0;
        end
    always@(arrived,gas_tank_empty)
        begin
            if (arrived>0|gas_tank_empty>0)
           keep_driving = 1'b0;
           else
           keep_driving = 1'b1;
           
        end
endmodule
