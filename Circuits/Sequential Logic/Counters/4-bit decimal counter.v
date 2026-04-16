module decade_counter(input clk,input reset,input enable,output reg [3:0]q);
    always @(posedge clk) begin
        if(reset || (q==9 && enable))
            q<=0;
        else begin
            if(enable)
            	q<=q+1;
            else
                q<=q;
        end
    end
endmodule
module top_module (input clk,input reset,   output [3:1] ena,output [15:0] q);
    wire ena0;
    assign ena0=1;
    assign ena[1]=(q[3:0]==9);
    assign ena[2]=(q[7:4]==9 && q[3:0]==9);
    assign ena[3]=(q[11:8]==9 && q[7:4]==9 && q[3:0]==9);
    decade_counter(clk,reset,ena0,q[3:0]);
    decade_counter(clk,reset,ena[1],q[7:4]);
    decade_counter(clk,reset,ena[2],q[11:8]);
    decade_counter(clk,reset,ena[3],q[15:12]);
endmodule
