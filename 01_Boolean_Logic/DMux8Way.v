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
    DMux4Way d1(in,sel[2:1],ch1,ch2,ch3,ch4);
    DMux d2(ch1,sel[0],a,b);
    DMux d3(ch2,sel[0],c,d);
    DMux d4(ch3,sel[0],e,f);
    DMux

    d5(ch4,sel[0],g,h);

    // side note:

endmodule
