//module cordic(in_angle, current_angle, clock, cos, sin);
module cordic(in_angle, init, clock);	
	input signed [1:-16] in_angle;
	input init,
		  clock;

	reg signed [1:-16] current_angle;
	
	wire signed [1:-16] lut_angle;
	
	reg signed [1:-16] cos;
	reg signed [1:-16] sin;

	reg signed [1:-16] cos_old;
	reg signed [1:-16] sin_old;

	reg done;
	
	reg [4:0] count;

	LUT lut(
		.index(count),
		.return_angle(lut_angle)
		);

	always @(init) begin 
		$dumpfile("test.vcd");
		$dumpvars(0,cordic);
		current_angle <= 0;
		count <= 0;
		done <= 0;
		
		cos <= 18'b001001101101110101;
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
				
			//$display("angle: %b cos: %b	sin: %b", current_angle, cos, sin);
			$display("angle: %d cos: %d sin: %d", current_angle, cos, sin);
				
			if(lut_angle == 1) begin
				done = 1;
				$display("done");
			end
				
			count <= count + 1;
		end
endmodule
