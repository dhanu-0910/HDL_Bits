module top_module (input [2:0] SW,input [1:0] KEY,output [2:0] LEDR); 
    mux m0(KEY[0],KEY[1],SW[0],LEDR[2],LEDR[0]);
    mux m1(KEY[0],KEY[1],SW[1],LEDR[0],LEDR[1]);
    mux m2(KEY[0],KEY[1],SW[2],LEDR[2]^LEDR[1],LEDR[2]);        
endmodule
        
module mux(input clk,input L,input R,input q,output Q);
    always @(posedge clk) begin
        case(L)
            1:Q<=R;
            0:Q<=q;
        endcase
    end
endmodule
