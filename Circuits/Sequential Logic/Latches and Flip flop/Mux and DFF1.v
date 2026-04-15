module top_module (input clk,input w, R, E, L,output Q);
    always @(posedge clk) begin
        case(L)
            1:Q<=R;
            0: begin
                case(E)
                    1:Q<=w;
                    0:Q<=Q;
                endcase
            end
        endcase
    end
endmodule
