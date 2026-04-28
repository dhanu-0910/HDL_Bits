module top_module(input clk,input areset,input bump_left,input bump_right,output walk_left,output walk_right);
	parameter left=0,right=1;
    reg state, next_state;
    always @(*) begin
        case(state)
            left: begin
                if(bump_left) 
                    next_state<=right;
                else
                    next_state<=left;
            end
            right: begin
                if(bump_right) 
                    next_state<=left;
                else
                    next_state<=right;
            end
        endcase
    end
    always @(posedge clk, posedge areset) begin
        if(areset)begin
            state<=left;
        end
        else
            state<=next_state;
    end
    assign walk_left = (state == left);
    assign walk_right = (state == right);
endmodule
