module cordic(in_angle, init, clock, cos_out, sin_out);	
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
		
		assign cos_out = cos;
		assign sin_out = sin;
		
endmodule
