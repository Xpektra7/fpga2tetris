/**
 * 16-bit register:
 * If load[t] == 1 then out[t+1] = in[t]
 * else out does not change
 */

`default_nettype none

module Register(
  input clk,
  input [15:0] in,
  input load,
  output reg [15:0] out
);

  // A way to do it ( probably not the best way according to the style guide )
  // always @(posedge clk) begin
  //   if (load) begin
  //     out <= in;
  //   end
  // end
  genvar i;
  generate
    for(i=0; i < 16; i++) begin : gen_bit
      Bit bit_inst(.clk(clk),.in(in[i]), .load(load), .out(out[i]));
    end
  endgenerate

endmodule
