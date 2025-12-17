/**
 * Computes the sum of two bits.
 */

`default_nettype none
module HalfAdder(
	input a,		//1-bit input
	input b,		//1-bit input
	output sum,	//Right bit of a + b
	output carry	//Lef bit of a + b
);

	assign sum = a ^ b ;
	assign carry = a & b ;
	

endmodule
