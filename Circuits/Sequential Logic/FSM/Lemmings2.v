module top_module(input clk,input areset,input bump_left,input bump_right,input ground,output walk_left,output walk_right,output aaah ); 
	parameter left=0,right=1,fall_left=2,fall_right=3;
    reg [1:0]state, next_state;
    always @(*) begin
        case(state)
            left: begin
                if(!ground)
                    next_state<=fall_left;
                else if(bump_left)
                    next_state<=right;
                else
                    next_state<=left;
            end
            right: begin
                if(!ground)
                    next_state<=fall_right;
                else if(bump_right)
                    next_state<=left;
                else
                    next_state<=right;
            end
            fall_left: begin
                if(ground)
                    next_state<=left;
                else
                    next_state<=fall_left;
            end
            fall_right: begin
                if(ground)
                    next_state<=right;
                else
                    next_state<=fall_right;
            end
            default: next_state<=left;
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
    assign aaah = (state == fall_left || state == fall_right);
endmodule
