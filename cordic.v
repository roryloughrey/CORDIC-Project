//module cordic(in_angle, current_angle, clock, cos, sin);
module cordic(in_angle, init, clock);	
	input signed [1:-16] in_angle;

	reg signed [1:-16] current_angle;
	
	wire signed [1:-16] lut_angle;
//reg [17:0] cos;
//reg [17:0] sin;

//reg [17:0] cos_old;
//reg [17:0] sin_old;

	input init;
	input clock;
	reg done;
	
	reg [4:0] count;

	LUT lut(
		.index(count),
		.neg(sign),
		.return_angle(lut_angle)
		);

	always @(init) begin 
		current_angle <= 0;
		count <= 0;
		done <= 0;
	end

	always @(posedge clock)
		if(!init) if(!done) begin
			if(current_angle <= in_angle) begin
				current_angle <= current_angle + lut_angle;
				$display("%b	+", current_angle);
			end
			else begin
				current_angle <= current_angle - lut_angle;
				$display("%b	-", current_angle);
			end
				
			if(lut_angle == 1) begin
				done = 1;
				$display("init: %b	done: %b", init, done);
			end
				
			count <= count + 1;
		end
endmodule