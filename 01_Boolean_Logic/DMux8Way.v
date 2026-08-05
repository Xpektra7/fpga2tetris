/**
 * 8-way demultiplexor:
 * {a, b, c, d, e, f, g, h} = {in, 0, 0, 0, 0, 0, 0, 0} if sel == 000
 *                            {0, in, 0, 0, 0, 0, 0, 0} if sel == 001
 *                            etc.
 *                            {0, 0, 0, 0, 0, 0, 0, in} if sel == 111
 */

`default_nettype none
module DMux8Way(
  input in,
  input [2:0] sel,
    output a,
  output b,
  output c,
  output d,
  output e,
  output f,
  output g,
  output h
);
/*
  assign a = sel == 3'b000 ? in : 1'b0;
  assign b = sel == 3'b001 ? in : 1'b0;
  assign c = sel == 3'b010 ? in : 1'b0;
  assign d = sel == 3'b011 ? in : 1'b0;
  assign e = sel == 3'b100 ? in : 1'b0;
  assign f = sel == 3'b101 ? in : 1'b0;
  assign g = sel == 3'b110 ? in : 1'b0;
  assign h = sel == 3'b111 ? in : 1'b0;
*/

    wire ch1,ch2,ch3,ch4;
    DMux4Way d1(.in(in),.sel(sel[2:1]),.a(ch1),.b(ch2),.c(ch3),.d(ch4));
    DMux d2(.in(ch1),.sel(sel[0]),.a(a),.b(b));
    DMux d3(.in(ch2),.sel(sel[0]),.a(c),.b(d));
    DMux d4(.in(ch3),.sel(sel[0]),.a(e),.b(f));
    DMux d5(.in(ch4),.sel(sel[0]),.a(g),.b(h));

    // side note:

endmodule
