module LUT(index, return_angle);
	input [4:0] index;
	input neg;
	
	output reg [1:-16] return_angle;
	
	wire [1:-16] A_tab [0:17];
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
	
		
	always @(*)	
		return_angle <= A_tab[index];
	
endmodule