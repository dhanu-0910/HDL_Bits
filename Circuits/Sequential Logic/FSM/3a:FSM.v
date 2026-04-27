module top_module (input clk,input reset,input s,input w,output z);
	parameter A=0,B=1;
    reg state,next_state;
    reg [1:0]count,count1;
    always @(posedge clk)begin
        if(reset) begin
            state<=A;
            count=0;
            count1=0;
        end
        else begin
            state<=next_state;
            if(state==B) begin
                if(count==3)begin
                    count1=0;
                    count=0;
                end
                if(w==1)
                    count1=count1+1;
                count=count+1;
            end
        end
    end
    always @(*) begin
        case(state)
            A: begin
                if(s)
                    next_state<=B;
                else
                    next_state<=A;
            end
            B: next_state<=B;
        endcase
    end 
    assign z=(count1==2 & count==3);
endmodule
