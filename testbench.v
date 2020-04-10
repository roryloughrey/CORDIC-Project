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
		in = 18'b010100110011001101;
		#10 i = 0;
			
		#200 i = 1;
		in = ~in;
		
		#10 i = 0;
			
		#200 $finish;
	end
>>>>>>> 32cc87d66527b0186311974dc4191b7136ad8c1d
endmodule