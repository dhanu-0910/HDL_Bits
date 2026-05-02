module top_module (input clk,input reset, input [7:0] in,output reg [23:0] out_bytes,output reg done);
    localparam S0 = 2'd0,S1 = 2'd1,S2 = 2'd2;
    reg [1:0] state, next;
    always @(posedge clk) begin
        if (reset)
            state <= S0;
        else
            state <= next;
    end
    always @(*) begin
        case (state)
            S0: next = (in[3]) ? S1 : S0;
            S1: next = S2;
            S2: next = S0;
            default: next = S0;
        endcase
    end
    always @(posedge clk) begin
        if (reset) begin
            out_bytes <= 24'd0;
            done <= 0;
        end else begin
            done <= 0;
            case (state)
                S0: begin
                    if (in[3])   
                        out_bytes[23:16] <= in;
                end
                S1: begin
                    out_bytes[15:8] <= in;   
                end
                S2: begin
                    out_bytes[7:0] <= in;    
                    done <= 1;             
                end
            endcase
        end
    end
endmodule
