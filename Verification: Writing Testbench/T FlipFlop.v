module top_module ();
    reg clk,reset;
    reg t;
    wire q;
    tff t0(.clk(clk),.reset(reset),.t(t),.q(q));
    always #5 clk=~clk;
    initial begin
        clk=0;
        reset=1;#10;
        reset=0;t=1;#10;
    end     
endmodule
