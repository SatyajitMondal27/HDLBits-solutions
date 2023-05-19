/*Given the following state machine with 1 input and 2 outputs:

Fsmonehot.png

Suppose this state machine uses one-hot encoding, where state[0] through state[9] correspond to the states S0 though S9, respectively. The outputs are zero unless otherwise specified.

Implement the state transition logic and output logic portions of the state machine (but not the state flip-flops). You are given the current state in state[9:0] and must produce next_state[9:0] and the two outputs. Derive the logic equations by inspection assuming a one-hot encoding. 
(The testbench will test with non-one hot inputs to make sure you're not trying to do something more complicated).*/
module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2);
    parameter s0=10'd1,s1=10'd2,s2=10'd4,s3=10'd8,s4=10'd16,s5=10'd32,s6=10'd64,s7=10'd128,s8=10'd256,s9=10'd512;
    assign next_state[0]=(state[0]&(~in))|(state[1]&(~in))|(state[2]&(~in))|(state[3]&(~in))|(state[4]&(~in))|(state[7]&(~in))|(state[8]&(~in))|(state[9]&(~in));
    assign next_state[1]=(state[0]&(in))|(state[8]&(in))|(state[9]&(in));
    assign next_state[2]=state[1]&in;
    assign next_state[3]=state[2]&in;
    assign next_state[4]=state[3]&in;
    assign next_state[5]=state[4]&in;
    assign next_state[6]=state[5]&in;
    assign next_state[7]=state[6]&in|state[7]&in;
  
    assign next_state[8]=state[5]&~in;
    assign next_state[9]=state[6]&~in;
    
    assign out1=state[8]|state[9];
    assign out2=state[7]|state[9];
            

endmodule