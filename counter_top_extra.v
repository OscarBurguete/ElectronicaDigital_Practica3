`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////
module Counter_top(clear, clk, up_down_top, a, b, c, d, e, f, g);
input clear;
input clk;
input up_down_top;
output a, b, c, d, e, f, g;
wire clk_div_w;
wire in_or;
wire up_down_toggle;
wire clear_top;
wire [3:0]cont_w;
counter25 m0(
.reset(clear_top), //in
.clk(clk), //in
.div_clk(clk_div_w) //out
);
counter4 m1(
.up_down(up_down_toggle), // in
.reset(clear_top), // in
.div_clk(clk_div_w), //in
.cont(cont_w) // out
);
comparator m2(
.up_down(up_down_toggle), //in
.cont(cont_w), //in 
.reset(in_or) //or
);
or_module m3(
.in_one(clear),
.in_two(in_or),
.reset_out(clear_top));
decoder m4(
.data(cont_w), //in
.a(a),
.b(b),
.c(c),
.d(d),
.e(e),
.f(f),
.g(g)
);

mode_toggle m5(
.clk_div(clk_div_w),
.reset(clear),
.count(cont_w),
.toggle(up_down_toggle));

endmodule
