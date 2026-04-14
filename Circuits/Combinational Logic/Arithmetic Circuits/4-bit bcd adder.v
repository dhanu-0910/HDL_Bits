module top_module ( input [15:0] a, b,input cin,output cout,output [15:0] sum );
    wire [3:0]cout_t;
    bcd_fadd b0(.a(a[3:0]),.b(b[3:0]),.cin(cin),.sum(sum[3:0]),.cout(cout_t[0]));
    genvar i;
    generate
        for(i=1;i<4;i++) begin:ripple
            bcd_fadd b0(.a(a[4*i+3:4*i]),.b(b[4*i+3:4*i]),.cin(cout_t[i-1]),.sum(sum[4*i+3:4*i]),.cout(cout_t[i]));
        end
    endgenerate
    assign cout=cout_t[3];
endmodule
