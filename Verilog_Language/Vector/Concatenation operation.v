module top_module (input [4:0] a, b, c, d, e, f,output [7:0] w, x, y, z );
    wire [29:0]p;
    assign p = {a,b,c,d,e,f};
    assign w=p[29:22];
    assign x=p[21:14];
    assign y=p[13:6];
    assign z={p[5:0],2'b11};
endmodule
