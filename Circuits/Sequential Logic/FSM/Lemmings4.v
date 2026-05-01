module top_module(input clk,input areset,input bump_left,input bump_right,input ground,input dig,output walk_left,output walk_right,output aaah,output digging ); 
	parameter left=0,right=1,fall_left=2,fall_right=3,dig_left=4,dig_right=5,splat=6;
    reg [2:0]state,next_state;
    integer count;
    always @(posedge clk or posedge areset)begin
        if(areset) begin
            state<=left;
            count<=0;
        end
        else begin
            state<=next_state;
            if(state==fall_left || state==fall_right)
                count<=count+1;
            else
                count<=0;
        end        
    end
    always @(*)begin
        case(state)
            left: begin
                if(!ground)
                    next_state=fall_left;
                else if(dig)
                    next_state=dig_left;
                else if(bump_left)
                    next_state=right;
                else
                    next_state=left;
            end
            right: begin
                if(!ground)
                    next_state=fall_right;
                else if(dig)
                    next_state=dig_right;
                else if(bump_right)
                    next_state=left;
                else
                    next_state=right;
            end
            fall_left: begin
                if(!ground)
                    next_state=fall_left;
                else if(count>=20)
                    next_state=splat;
                else
                    next_state=left;
            end
            fall_right: begin
                if(!ground)
                    next_state=fall_right;
                else if(count>=20)
                    next_state=splat;
                else
                    next_state=right;
            end
            dig_left: begin
                if(!ground)
                    next_state=fall_left;
                else
                    next_state=dig_left;
            end
            dig_right: begin
                if(!ground)
                    next_state=fall_right;
                else
                    next_state=dig_right;
            end
            splat: begin
                next_state=splat;
            end
            default: next_state=left;
        endcase
    end
    assign walk_left=(state==left);
    assign walk_right=(state==right);
    assign aaah=(state==fall_left || state==fall_right);
    assign digging= (state==dig_left || state==dig_right);
    
endmodule
