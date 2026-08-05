/**
 * A 16-bit counter with load and reset control bits.
 * if      (reset[t] == 1) out[t+1] = 0
 * else if (load[t] == 1)  out[t+1] = in[t]
 * else if (inc[t] == 1)   out[t+1] = out[t] + 1  (integer addition)
 * else                    out[t+1] = out[t]
 */

`default_nettype none
module PC(
  input clk,
  input [15:0] in,
  input load,
  input inc,
  input reset,
  output reg [15:0] out
);

  always @(posedge clk) begin
    if (reset) begin
      out <= 16'b0;
    end
    else if (load) begin
      out <= in;
    end
    else if (inc) begin
      out <= out + 16'b0000000000000001;
    end
    else begin
      out <= out;
    end
  end



endmodule
