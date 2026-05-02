module top_module(input clk,input [7:0] in,input reset,output reg done);     
    parameter idle=0,byte1=1,byte2=2;
    reg [1:0] state,next;
    always @(*) begin    
        next = state;
        case(state)
            idle:next=(in[3])?byte1:idle;
            byte1:next=byte2;
            byte2:next=idle;
        endcase
    end
    always @(posedge clk) begin  
        if(reset) begin
            state<=idle;
            done<=0;
        end else begin
            state<=next;
            done<=(state==byte2);
        end
    end
endmodule
