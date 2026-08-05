/**
 * 16-bit Not:
 * for i=0..15: out[i] = not in[i]
 */

`default_nettype none
module Not16(
  input [15:0] in,
  output [15:0] out
);

  // assign out = ~in;

  genvar i;
  generate
    for(i = 0; i < 16; i++) begin : gen_not
      Not not_inst(.in(in[i]),.out(out[i]));
    end
  endgenerate

endmodule
