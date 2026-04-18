/**
 * 4-way demultiplexor:
 * {a, b, c, d} = {in, 0, 0, 0} if sel == 00
 *                {0, in, 0, 0} if sel == 01
 *                {0, 0, in, 0} if sel == 10
 *                {0, 0, 0, in} if sel == 11
 */

`default_nettype none
module DMux4Way(
	input in,
	input [1:0] sel,
    output a,
	output b,
	output c,
	output d
);
/*
	assign a = sel == 2'b00 ? in : 1'b0 ;
	assign b = sel == 2'b01 ? in : 1'b0 ;
	assign c = sel == 2'b10 ? in : 1'b0 ;
	assign d = sel == 2'b11 ? in : 1'b0 ;
*/
    wire ch1,ch2;

    DMux d1(in,sel[1],ch1,ch2);
    DMux d2(ch1,sel[0],a,b);
    DMux d3(ch2,sel[0],c,d);


endmodule
