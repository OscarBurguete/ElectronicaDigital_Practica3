`timescale 1ns / 1ns
module counter_tb();
reg clear;
reg clk;
reg up_down_top;
wire a, b, c, d, e, f, g;
Counter_top dut(
.clear(clear),
.clk(clk),
.up_down_top(up_down_top),
.a(a),
.b(b),
.c(c),
.d(d),
.e(e),
.f(f),
.g(g)
);

initial begin
 clk = 1'b0;
 clear=1'b1;
 up_down_top=1'b0;
 #100;
 clear=1'b0;
 up_down_top=1'b0;
 #20000
 up_down_top=1'b1;
 #20000
 $stop;
end
 always
 #18.51852 clk = ! clk;
endmodule