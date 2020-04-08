module testbench();
	reg signed [1:-16] in;
	reg c;
	reg i;

	cordic cordic(
		.in_angle(in),
		.init(i),
		.clock(c)
		);

	initial begin
		in = 18'b0;
		c = 0;
		i = 1;
	end

	always
		#5 c = ~c;
	
	initial begin
		in = 18'b001100110011001101;
		#10 i = 0;
			
		#200 i = 1;
		in = 18'b010001000010101000;
			
		#10 i = 0;
			
		#200 $finish;
	end
endmodule