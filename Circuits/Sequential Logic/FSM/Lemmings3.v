module top_module(input clk,input areset,input bump_left,input bump_right,input ground,input dig,output walk_left,output walk_right,output aaah,output digging ); 
	parameter left=0,right=1,fall_left=2,fall_right=3,dig_left=4,dig_right=5;
    reg [2:0]state,next_state;
    always @(posedge clk or posedge areset) begin
        if(areset)
            state<=left;
        else
            state<=next_state;
    end
    always @(*)begin
        case(state)
            left: next_state= ground?(dig?dig_left:(bump_left?right:left)):fall_left;
            right: next_state= ground?(dig?dig_right:(bump_right?left:right)):fall_right;
            fall_left: next_state= ground?left:fall_left;
            fall_right: next_state= ground?right:fall_right;
            dig_left: next_state= ground?dig_left:fall_left;
            dig_right: next_state= ground?dig_right:fall_right;
            default: next_state= left;
        endcase
    end
    assign walk_left= (state==left);
    assign walk_right= (state==right);
    assign aaah= (state==fall_left || state==fall_right);
    assign digging= (state==dig_left || state==dig_right);
endmodule
