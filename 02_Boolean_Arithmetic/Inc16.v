/**
 * 16-bit incrementer:
 * out = in + 1 (arithmetic addition)
 */

`default_nettype none
module Inc16(
	input [15:0] in,
	output [15:0] out
);

	wire carry0 = in[0] & 1'b1;
	wire carry1 = in[1] & carry0;
	wire carry2 = in[2] & carry1;
	wire carry3 = in[3] & carry2;
	wire carry4 = in[4] & carry3;
	wire carry5 = in[5] & carry4;
	wire carry6 = in[6] & carry5;
	wire carry7 = in[7] & carry6;
	wire carry8 = in[8] & carry7;
	wire carry9 = in[9] & carry8;
	wire carry10 = in[10] & carry9;
	wire carry11 = in[11] & carry10;
	wire carry12 = in[12] & carry11;
	wire carry13 = in[13] & carry12;
	wire carry14 = in[14] & carry13;
	wire carry15 = in[15] & carry14;

	assign out[0] = in[0] ^ 1'b1;
	assign out[1] = in[1] ^ carry0;
	assign out[2] = in[2] ^ carry1;
	assign out[3] = in[3] ^ carry2;
	assign out[4] = in[4] ^ carry3;
	assign out[5] = in[5] ^ carry4;
	assign out[6] = in[6] ^ carry5;
	assign out[7] = in[7] ^ carry6;
	assign out[8] = in[8] ^ carry7;
	assign out[9] = in[9] ^ carry8;
	assign out[10] = in[10] ^ carry9;
	assign out[11] = in[11] ^ carry10;
	assign out[12] = in[12] ^ carry11;
	assign out[13] = in[13] ^ carry12;
	assign out[14] = in[14] ^ carry13;
	assign out[15] = in[15] ^ carry14;

endmodule
