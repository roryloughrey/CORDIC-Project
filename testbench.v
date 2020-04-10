/*
* testbench.v
* 
* Authors: Brian Bulfin (16157516, Rory Loughrey (16178041), Micheal O'Connor (16188713)
*
* Testbench to drive cordic.v and test cases to illustrate that cordic.v is correct
*/

module testbench();
	reg signed [1:-16] in;

	wire signed [1:-16] cos;
	wire signed [1:-16] sin;
	reg c;
	reg i;
	
	localparam sf = 65536;

	cordic cordic(
		.in_angle(in),
		.init(i),
		.clock(c),
		.cos_out(cos),
		.sin_out(sin)
		);

	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0, cordic);
	
		in = 18'b0;
		c = 0;
		i = 1;
	end

	always
		#10 c = ~c;
		
	initial begin
		in = 18'b01_0100110011001101;
		$display("input angle: %f", $itor(in)/sf);
		
		#5 i = 0;
			
		#400; //$display("cos: %f sin: %f", $itor(cos)/sf, $itor(sin)/sf);
		i = 1;
		in = ~in;
		
		#20 i = 0;
			
		#400; //$display("cos: %f sin: %f", $itor(cos)/sf, $itor(sin)/sf);
		$finish;
	end
endmodule