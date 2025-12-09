/**
 * Exclusive-or gate:
 * out = not (a == b)
 */

`default_nettype none
module Xor(
	input a,
	input b,
	output out
);

	assign out = a == b ? 1'b0 : 1'b1 ;

endmodule
