/*This is the third component in a series of five exercises that builds a complex counter out of several smaller circuits. See the final exercise for the overall design.

As part of the FSM for controlling the shift register, we want the ability to enable the shift register for exactly 4 clock cycles whenever the proper bit pattern is detected. We handle sequence detection in Exams/review2015_fsmseq, so this portion of the FSM only handles enabling the shift register for 4 cycles.

Whenever the FSM is reset, assert shift_ena for 4 cycles, then 0 forever (until reset).*/
module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    reg [2:0]state,next_state;
    parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101;
    always@(*)
        begin
            if(state==s0 && reset==1)
                next_state=s1;
            else if(state==s0 && reset==0)
                next_state=s0;
            else if(state==s1)
                next_state=s2;
            else if(state==s2)
                next_state=s3;
            else if(state==s3)
                next_state=s4;
            else if(state==s4 && reset)
                next_state=s1;
            else if(state==s4 && !reset)
                next_state=s0;
        end
    
    always@(posedge clk)
        state<=next_state;
    
    assign shift_ena=(state==s1)||(state==s2)||(state==s3)||(state==s4);
            
                
                
endmodule