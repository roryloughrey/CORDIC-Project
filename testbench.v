module testbench();
	reg [17:0] in = 18'b0;
	reg c = 0;

	cordic cordic(
		.in_angle(in), 
		.clock(c)
		);

	always
		#5 c = ~c;
	
	initial
		begin
			in = 18'b001100110011001101;
			#180;
		
			$finish;
		end
endmodule