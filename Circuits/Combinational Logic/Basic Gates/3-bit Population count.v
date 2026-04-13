module top_module( input [2:0] in,output [1:0] out );
    assign out=in[0]+in[1]+in[2];
    //assign out[0] = in[2]&~in[1]&~in[0] | in[2]&in[1]&in[0] | ~in[2]&~in[1]&in[0] | ~in[2]&in[1]&~in[0]  ;(odd no. of 1's)
    //assign out[1] = in[2]&in[0] | in[2]&in[1] | in[1]&in[0]  ;(number greater than 2)
endmodule
