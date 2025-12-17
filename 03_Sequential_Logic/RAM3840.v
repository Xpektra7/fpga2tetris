/**
* RAM3840 implements 3840 Bytes of RAM addressed from 0 - 3839
* out = M[address]
* if (load =i= 1) M[address][t+1] = in[t]
*/

`default_nettype none
module RAM3840(
	input clk,
	input [11:0] address,
	input [15:0] in,
	input load,
	output [15:0] out
);
	
	// memory array: 3840 x 16-bit (addresses 0..3839)
	reg [15:0] mem [0:3839];

	// asynchronous read
	assign out = mem[address];

	// synchronous write
	always @(posedge clk) begin
		if (load)
			mem[address] <= in;
	end

endmodule
