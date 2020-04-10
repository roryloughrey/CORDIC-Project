<<<<<<< HEAD
/*
* cordic.v
* 
* Authors: Brian Bulfin (16157516, Rory Loughrey (16178041), Micheal O'Connor (16188713)
*
* Verilog implementation of cordic.c 
*/

<<<<<<< HEAD
<<<<<<< HEAD
module cordic;
	
=======
=======
>>>>>>> 32cc87d66527b0186311974dc4191b7136ad8c1d
module cordic(in_angle, init, clock);	
=======
module cordic(in_angle, init, clock, cos_out, sin_out);	
>>>>>>> b655e6c693d548f5f277353b41d3237996d65b19
	input signed [1:-16] in_angle;
	input init,
		  clock;

	wire signed [1:-16] lut_angle;

	reg signed [1:-16] current_angle;
	
	reg signed [1:-16] cos;
	reg signed [1:-16] sin;

	reg signed [1:-16] cos_old;
	reg signed [1:-16] sin_old;

	reg [4:0] count;

	reg done;
	
	localparam K = 18'b00_1001101101110101;
	
	output [1:-16] cos_out;
	output [1:-16] sin_out;

	LUT lut(
		.index(count),
		.return_angle(lut_angle)
		);

	always @(init) begin 
		//$dumpfile("test.vcd");
		//$dumpvars(0,cordic);
		current_angle <= 0;
		count <= 0;
		done <= 0;
		
		cos <= K;		
		sin <= 0;
	end

	always @(posedge clock)
		if(!init) if(!done) begin
			cos_old = cos; sin_old = sin;
			
			if(current_angle <= in_angle) begin
				current_angle <= current_angle + lut_angle;
				
				cos <= cos - (sin_old>>>count);
				sin <= sin + (cos_old>>>count);
			end
			else begin
				current_angle <= current_angle - lut_angle;
				
				cos <= cos + (sin_old>>>count);
				sin <= sin - (cos_old>>>count);
			end
				
			$display("%d  cos: %f sin: %f", count, $itor(cos)/65536, $itor(sin)/65536);
				
			if(lut_angle == 1) begin
				done = 1;
				$display("done");
			end
			
			count <= count + 1;
		end
<<<<<<< HEAD
<<<<<<< HEAD
		
>>>>>>> 445c44286023847adfa328f5f28c1208f7772eb7
endmodule
=======
=======
		
		assign cos_out = cos;
		assign sin_out = sin;
		
>>>>>>> b655e6c693d548f5f277353b41d3237996d65b19
endmodule
>>>>>>> 32cc87d66527b0186311974dc4191b7136ad8c1d
