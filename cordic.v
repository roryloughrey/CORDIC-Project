//module cordic(in_angle, current_angle, clock, cos, sin);
module cordic(in_angle, clock);	
	input [17:0] in_angle;

	output reg [17:0] current_angle;
	
	wire [17:0] lut_angle;
//reg [17:0] cos;
//reg [17:0] sin;

//reg [17:0] cos_old;
//reg [17:0] sin_old;

	input clock;
	
	reg sign = 0;
	
	reg [4:0] count = 4'b0;

	LUT lut(
		.index(count),
		.neg(sign),
		.return_angle(lut_angle)
		);

	initial 
		begin
			current_angle <= 0;
		
		//$display("%b", current_angle);
		//$display("%b", lut_angle);
		end

	always @(posedge clock) 
		begin
			if(current_angle <= in_angle)
				sign = 0;
			else
				sign = 1;
				
			current_angle <= current_angle + lut_angle;
			count <= count + 1;
			$display("%b     %b", current_angle, sign);
		end
endmodule