module top_module (input clk,input reset, input x,output z);
	parameter a=0,b=1,c=2,d=3,e=4;
    reg [2:0]state,next_state;
    always @(posedge clk)begin
        if(reset)
            state<=a;
        else
            state<=next_state;
    end
    always @(*)begin
        case(state)
            a: begin
                if(x)
                    next_state<=b;
                else
                    next_state<=a;
            end
            b: begin
                if(x)
                    next_state<=e;
                else
                    next_state<=b;
            end
            c: begin
                if(x)
                    next_state<=b;
                else
                    next_state<=c;
            end
            d: begin
                if(x)
                    next_state<=c;
                else
                    next_state<=b;
            end
            e: begin
                if(x)
                    next_state<=e;
                else
                    next_state<=d;
            end
        endcase
    end
    assign z=(state==d || state==e);                    
endmodule
