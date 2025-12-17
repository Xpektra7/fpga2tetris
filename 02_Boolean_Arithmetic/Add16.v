/**
 * Adds two 16-bit values.
 * The most significant carry bit is ignored.
 * out = a + b (16 bit)
 */

`default_nettype none
module Add16(
	input [15:0] a,
	input [15:0] b,
	output [15:0] out
);

	wire carry0 = a[0] & b[0];
	wire carry1 = ( a[1] & b[1] ) | (carry0 & ( a[1] ^ b[1] ));
	wire carry2 = ( a[2] & b[2] ) | (carry1 & ( a[2] ^ b[2] ));
	wire carry3 = ( a[3] & b[3] ) | (carry2 & ( a[3] ^ b[3] ));
	wire carry4 = ( a[4] & b[4] ) | (carry3 & ( a[4] ^ b[4] ));
	wire carry5 = ( a[5] & b[5] ) | (carry4 & ( a[5] ^ b[5] ));
	wire carry6 = ( a[6] & b[6] ) | (carry5 & ( a[6] ^ b[6] ));
	wire carry7 = ( a[7] & b[7] ) | (carry6 & ( a[7] ^ b[7] ));
	wire carry8 = ( a[8] & b[8] ) | (carry7 & ( a[8] ^ b[8] ));
	wire carry9 = ( a[9] & b[9] ) | (carry8 & ( a[9] ^ b[9] ));
	wire carry10 = ( a[10] & b[10] ) | (carry9 & ( a[10] ^ b[10] ));
	wire carry11 = ( a[11] & b[11] ) | (carry10 & ( a[11] ^ b[11] ));
	wire carry12 = ( a[12] & b[12] ) | (carry11 & ( a[12] ^ b[12] ));
	wire carry13 = ( a[13] & b[13] ) | (carry12 & ( a[13] ^ b[13] ));
	wire carry14 = ( a[14] & b[14] ) | (carry13 & ( a[14] ^ b[14] ));
	wire carry15 = ( a[15] & b[15] ) | (carry14 & ( a[15] ^ b[15] ));

	assign out[0] = a[0] ^ b[0];
	assign out[1] = ( a[1] ^ b[1] ) ^ carry0;
	assign out[2] = ( a[2] ^ b[2] ) ^ carry1;
	assign out[3]  = (a[3]  ^ b[3])  ^ carry2;
	assign out[4]  = (a[4]  ^ b[4])  ^ carry3;
	assign out[5]  = (a[5]  ^ b[5])  ^ carry4;
	assign out[6]  = (a[6]  ^ b[6])  ^ carry5;
	assign out[7]  = (a[7]  ^ b[7])  ^ carry6;
	assign out[8]  = (a[8]  ^ b[8])  ^ carry7;
	assign out[9]  = (a[9]  ^ b[9])  ^ carry8;
	assign out[10] = (a[10] ^ b[10]) ^ carry9;
	assign out[11] = (a[11] ^ b[11]) ^ carry10;
	assign out[12] = (a[12] ^ b[12]) ^ carry11;
	assign out[13] = (a[13] ^ b[13]) ^ carry12;
	assign out[14] = (a[14] ^ b[14]) ^ carry13;
	assign out[15] = (a[15] ^ b[15]) ^ carry14;

endmodule
