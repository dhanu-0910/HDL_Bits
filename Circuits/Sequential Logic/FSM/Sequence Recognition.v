module top_module(input clk,input reset,  input in,output disc,output flag,output err);
	parameter S0=0,S1=1,S2=2,S3=3,S4=4,S5=5,S6=6,SD=7,SF=8,SE=9;
    reg [3:0]state,next_state;
    always@(posedge clk) begin
        if(reset)
            state<=S0;
        else
            state<=next_state;
    end
    always @(*) begin
        case(state)
            S0: next_state=(in)?S1:S0;
            S1: next_state=(in)?S2:S0;
            S2: next_state=(in)?S3:S0;
            S3: next_state=(in)?S4:S0;
            S4: next_state=(in)?S5:S0;
            S5: next_state=(in)?S6:SD;
            S6: next_state=(in)?SE:SF;
            SD: next_state=(in)?S1:S0;
            SF: next_state=(in)?S1:S0;
            SE: next_state=(in)?SE:S0;
            default: next_state=S0;
        endcase           
    end
    assign disc=(state==SD);
    assign flag=(state==SF);
    assign err=(state==SE);
endmodule
