module top_module (input clk,input reset,input [3:1] s,output reg fr3,output reg fr2,output reg fr1,output reg dfr);
    parameter [2:0] A = 3'd0, B = 3'd1, C = 3'd2, D = 3'd3, E = 3'd4, F = 3'd5; 
    reg [2:0] state, next;
    always @(posedge clk) begin
        if (reset)
            state <= A;   
        else
            state <= next;
    end
    always @(*) begin
        case (state)
            A: next = s[1] ? C : A;
            B: next = s[2] ? E :(s[1] ? B : A);
            C: next = s[2] ? E :(s[1] ? C : A);
            D: next = s[3] ? F :(s[2] ? D : B);
            E: next = s[3] ? F :(s[2] ? E : B);
            F: next = s[3] ? F : D;
            default: next = A;
        endcase
    end
    always @(*) begin
        case (state)
            A: {fr3, fr2, fr1, dfr} = 4'b1111;
            B: {fr3, fr2, fr1, dfr} = 4'b0111;
            C: {fr3, fr2, fr1, dfr} = 4'b0110;
            D: {fr3, fr2, fr1, dfr} = 4'b0011;
            E: {fr3, fr2, fr1, dfr} = 4'b0010;
            F: {fr3, fr2, fr1, dfr} = 4'b0000;
            default: {fr3, fr2, fr1, dfr} = 4'b0000;
        endcase
    end

endmodule
