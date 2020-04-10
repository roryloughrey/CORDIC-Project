/*
* testbench.v
* 
* Authors: Brian Bulfin (16157516, Rory Loughrey (16178041), Micheal O'Connor (16188713)
*
* Testbench to drive cordic.v and test cases to illustrate that cordic.v is correct
*/

<<<<<<< HEAD
<<<<<<< HEAD
module testbench;
	
	cordic cordic();
	
	initial
		begin
		end
	
=======
=======
>>>>>>> 32cc87d66527b0186311974dc4191b7136ad8c1d
module testbench();
	reg signed [1:-16] in;
<<<<<<< HEAD
	reg c;
=======
	wire signed [1:-16] cos;
	wire signed [1:-16] sin;
	reg c;
>>>>>>> b655e6c693d548f5f277353b41d3237996d65b19
	reg i;
	
	localparam sf = 65536;

	cordic cordic(
		.in_angle(in),
		.init(i),
		.clock(c),
		.cos_out(cos),
		.sin_out(sin)
		);
<<<<<<< HEAD

	initial begin
		in = 18'b0;
		c = 0;
		i = 1;
	end
=======

	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0, cordic);
	
		in = 18'b0;
		c = 0;
		i = 1;
	end
>>>>>>> b655e6c693d548f5f277353b41d3237996d65b19

	always
		#10 c = ~c;
	
<<<<<<< HEAD
	initial
		begin
			in = 18'b001100110011001101;
			#180;
		
			$finish;
		end
		
>>>>>>> 445c44286023847adfa328f5f28c1208f7772eb7
=======
	initial begin
<<<<<<< HEAD
		in = 18'b010100110011001101;
		#10 i = 0;
			
		#200 i = 1;
		in = ~in;
		
		#10 i = 0;
			
		#200 $finish;
	end
>>>>>>> 32cc87d66527b0186311974dc4191b7136ad8c1d
=======
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
>>>>>>> b655e6c693d548f5f277353b41d3237996d65b19
endmodule