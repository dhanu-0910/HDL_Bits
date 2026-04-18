module top_module(input clk,input areset,    input in,output out); 
    parameter A=0, B=1; 
    reg state, next_state;
    always @(*) begin    
        case(state)
            A: begin
                if(in)
                    next_state<=A;
                else
                    next_state<=B;
            end
            B: begin
                if(in)
                    next_state<=B;
                else
                    next_state<=A;
            end
        endcase
    end
    always @(posedge clk, posedge areset) begin    
        if(areset)
            state<=B;
        else
            state<=next_state;
    end
    assign out=(state==B);
endmodule
