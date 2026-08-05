/**
* RAM256 implements 256 Bytes of RAM addressed from 0 - 255
* out = M[address]
* if (load =i= 1) M[address][t+1] = in[t]
*/

`default_nettype none
module RAM256(
  input clk,
  input [7:0] address,
  input [15:0] in,
  input load,
  output [15:0] out
);
  // put code here

endmodule
