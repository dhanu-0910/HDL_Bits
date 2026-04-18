module top_module (input [3:0] SW,input [3:0] KEY,output [3:0] LEDR); 
    wire [3:0]q;
    MUXDFF m0(KEY[0],KEY[1],KEY[2],q[1],SW[0],q[0]);
    MUXDFF m1(KEY[0],KEY[1],KEY[2],q[2],SW[1],q[1]);
    MUXDFF m2(KEY[0],KEY[1],KEY[2],q[3],SW[2],q[2]);
    MUXDFF m3(KEY[0],KEY[1],KEY[2],KEY[3],SW[3],q[3]);
    assign LEDR=q;
endmodule

module MUXDFF (input clk,input e,input l,input w,input r,output reg Q);
    always @(posedge clk)begin
        case(l)
            1:Q<=r;
            0:begin
                case(e)
                    1:Q<=w;
                    0:Q<=Q;
                endcase
            end
        endcase
    end                   
endmodule
