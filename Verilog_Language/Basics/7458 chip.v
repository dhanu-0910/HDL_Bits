module top_module ( input p1a, p1b, p1c, p1d, p1e, p1f,output p1y,input p2a, p2b, p2c, p2d,output p2y );
    wire x,y;
    and(x,p1a,p1c,p1b);
    and(y,p1f,p1e,p1d);
    or(p1y,x,y);
    wire u,v;
    and(u,p2a,p2b);
    and(v,p2c,p2d);
    or(p2y,u,v);
endmodule
