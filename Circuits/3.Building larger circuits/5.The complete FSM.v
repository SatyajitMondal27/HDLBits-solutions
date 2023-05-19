/*This is the fourth component in a series of five exercises that builds a complex counter out of several smaller circuits. See the final exercise for the overall design.

You may wish to do FSM: Enable shift register and FSM: Sequence recognizer first.

We want to create a timer that:

is started when a particular pattern (1101) is detected,
shifts in 4 more bits to determine the duration to delay,
waits for the counters to finish counting, and
notifies the user and waits for the user to acknowledge the timer.
In this problem, implement just the finite-state machine that controls the timer. The data path (counters and some comparators) are not included here.

The serial data is available on the data input pin. When the pattern 1101 is received, the state machine must then assert output shift_ena for exactly 4 clock cycles.

After that, the state machine asserts its counting output to indicate it is waiting for the counters, and waits until input done_counting is high.

At that point, the state machine must assert done to notify the user the timer has timed out, and waits until input ack is 1 before being reset to look for the next occurrence of the start sequence (1101).

The state machine should reset into a state where it begins searching for the input sequence 1101.

Here is an example of the expected inputs and outputs. The 'x' states may be slightly confusing to read. They indicate that the FSM should not care about that particular input signal in that cycle. For example, once a 1101 pattern is detected, the FSM no longer looks at the data input until it resumes searching after everything else is done.
*/
module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    reg [3:0]state,next_state;
    parameter s=0,s1=1,s11=2,s110=3,b0=4,b1=5,b2=6,b3=7,count=8,Wait=9;
    always@(*)
    begin
        if(state==s && data==0)
            next_state=s;
        else if(state==s && data==1)
            next_state=s1;
        else if(state==s1 && data==0)
            next_state=s;
        else if(state==s1 && data==1)
            next_state=s11;
        else if(state==s11 && data==0)
            next_state=s110;
        else if(state==s11 && data==1)
            next_state=s11;
        else if(state==s110 && data==0)
            next_state=s;
        else if(state==s110 && data==1)
            next_state=b0;
        else if(state==b0)
            next_state=b1;
        else if(state==b1)
            next_state=b2;
        else if(state==b2)
            next_state=b3;
        else if(state==b3)
            next_state=count;
        else if(state==count && !done_counting)
            next_state=count;
        else if(state==count && done_counting)
            next_state=Wait;
        else if(state==Wait && !ack)
            next_state=Wait;
        else if(state==Wait && ack)
            next_state=s;
    end
    
    always@(posedge clk)
        begin
            if(!reset)
                state<=next_state;
            else
                state<=s;
        end
    assign shift_ena=(state==b0)||(state==b1)||(state==b2)||(state==b3);
    assign counting=(state==count);
    assign done=(state==Wait);
endmodule