/**
 * 16-bit multiplexor:
 * for i = 0..15 out[i] = a[i] if sel == 0
 *                        b[i] if sel == 1
 */

`default_nettype none
module Mux8Way16(
  input [15:0] a,
  input [15:0] b,
  input [15:0] c,
  input [15:0] d,
  input [15:0] e,
  input [15:0] f,
  input [15:0] g,
  input [15:0] h,
    input [2:0] sel,
  output [15:0] out
);
/*
  assign out =  (sel == 3'b000) ? a :
          (sel == 3'b001) ? b :
          (sel == 3'b010) ? c :
          (sel == 3'b011) ? d :
          (sel == 3'b100) ? e :
          (sel == 3'b101) ? f :
          (sel == 3'b110) ? g : h;
*/

    wire [15:0] upper4,lower4;

    Mux4Way16 m1(.a(a),.b(b),.c(c),.d(d),.sel(sel[1:0]),.out(upper4));
    Mux4Way16 m2(.a(e),.b(f),.c(g),.d(h),.sel(sel[1:0]),.out(lower4));

    Mux16 m3(.a(upper4),.b(lower4),.sel(sel[2]),.out(out));

endmodule
