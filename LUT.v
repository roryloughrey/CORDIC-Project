module LUT(index, neg, return_angle);
	input [4:0] index;
	input neg;
	
	output reg [17:0] return_angle;
	
	wire [17:0] A_tab [0:17];
	assign A_tab[0] = 18'b001100100100001111;
	assign A_tab[1] = 18'b000111011010110010;
	assign A_tab[2] = 18'b000011111010110111;
	assign A_tab[3] = 18'b000001111111010101;
	assign A_tab[4] = 18'b000000111111111010;
	assign A_tab[5] = 18'b000000011111111110;
	assign A_tab[6] = 18'b000000010000000000;
	assign A_tab[7] = 18'b000000001000000000;
	assign A_tab[8] = 18'b000000000100000000;
	assign A_tab[9] = 18'b000000000010000000;
	assign A_tab[10] = 18'b000000000001000000;
	assign A_tab[11] = 18'b000000000000100000;
	assign A_tab[12] = 18'b000000000000010000;
	assign A_tab[13] = 18'b000000000000001000;
	assign A_tab[14] = 18'b000000000000000100;
	assign A_tab[15] = 18'b000000000000000010;
	assign A_tab[16] = 18'b000000000000000001;
	assign A_tab[17] = 18'b000000000000000000;
	
	wire [17:0] A_neg [0:17];
	assign A_neg[0] = 18'b110011011011110001;
	assign A_neg[1] = 18'b111000100101001110;
	assign A_neg[2] = 18'b111100000101001001;
	assign A_neg[3] = 18'b111110000000101011;
	assign A_neg[4] = 18'b111111000000000110;
	assign A_neg[5] = 18'b111111100000000010;
	assign A_neg[6] = 18'b111111110000000000;
	assign A_neg[7] = 18'b111111111000000000;
	assign A_neg[8] = 18'b111111111100000000;
	assign A_neg[9] = 18'b111111111110000000;
	assign A_neg[10] = 18'b111111111111000000;
	assign A_neg[11] = 18'b111111111111100000;
	assign A_neg[12] = 18'b111111111111110000;
	assign A_neg[13] = 18'b111111111111111000;
	assign A_neg[14] = 18'b111111111111111100;
	assign A_neg[15] = 18'b111111111111111110;
	assign A_neg[16] = 18'b111111111111111111;
	assign A_neg[17] = 18'b000000000000000000;
	
	always @(*)
		if(!neg)
			//assign return_angle = A_neg[index];
			return_angle <= A_neg[index];
		else
			//assign return_angle = A_tab[index];
			return_angle <= A_tab[index];
	
endmodule