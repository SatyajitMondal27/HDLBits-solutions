/*Now that you have a state machine that will identify three-byte messages in a PS/2 byte stream, add a datapath that will also output the 24-bit (3 byte) message whenever a packet is received (out_bytes[23:16] is the first byte, out_bytes[15:8] is the second byte, etc.).

out_bytes needs to be valid whenever the done signal is asserted. You may output anything at other times (i.e., don't-care).*/
module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

parameter s1=2'b00,s2=2'b01,s3=2'b10,s4=2'b11;
    reg [1:0]state;reg[1:0]next_state;
    reg [23:0]store;//to store the 3 bytes of data
    // State transition logic (combinational)
    always@(*)
        begin
            if(state==s1 && in[3]==0)
                begin
                    next_state=s1;    
                end
            else if(state==s1 && in[3]==1)
                begin
                    next_state=s2;
                end
            
            else if(state==s2)
                begin
                    next_state=s3;               
                end
            else if(state==s3)
                begin
                    next_state=s4;
                end
            else if(state==s4 && in[3]==0)
                begin
                    next_state=s1;
                end
            else if(state==s4 && in[3]==1)
                begin
                   next_state=s2;
                end
        end
            
    always@(posedge clk)
        begin
            if(state==s1 && in[3]==1)
                store[23:16]=in;
            else if(state==s1 && in[3]==0)
                store[23:16]=0;
            else if(state==s2)
                store[15:8]=in;
            else if(state==s3)
                store[7:0]=in;
            else if(state==s4 && in[3]==1)
                store[23:16]=in;
            else if(state==s4 && in[3]==0)
                store[23:16]=0;
            
        end          
  
    // State flip-flops (sequential)
    always@(posedge clk)
        begin
            if(reset)
                begin
                   state<=s1;
                 
                end
            
            else
                state<=next_state;
        end
 
    // Output logic
     assign done=state[0]&state[1];
    always@(state)
        begin
            if(state==s4)
                out_bytes=store;      
            else
                out_bytes=0;
   
        end

  
endmodule