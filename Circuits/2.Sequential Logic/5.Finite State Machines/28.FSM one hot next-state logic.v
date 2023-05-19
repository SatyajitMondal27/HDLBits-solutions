/*For this part, assume that a one-hot code is used with the state assignment 'y[6:1] = 000001, 000010, 000100, 001000, 010000, 100000 for states A, B,..., F, respectively.

Write a logic expression for the next-state signals Y2 and Y4. (Derive the logic equations by inspection assuming a one-hot encoding. The testbench will test with non-one hot inputs to make sure you're not trying to do something more complicated).*/
module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);

    assign Y2 = y[1]&&(~w);
    assign Y4  = w&&(y[2] || y[3] || y[5] || y[6]);
endmodule