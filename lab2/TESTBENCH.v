`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:22:46 04/10/2016 
// Design Name: 
// Module Name:    TESTBENCH 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TESTBENCH;
	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg [2:0] Ctrl;

	// Outputs
	wire [7:0] F;
	wire [7:0] F1;
	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.Ctrl(Ctrl), 
		.F(F)
	);
	ALUU uut1(
		.a(A),
		.b(B),
		.s(Ctrl),
		.z(F1)
	);
	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Ctrl = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Ctrl=0;
		A=6;
		B=2;
		#60;
		Ctrl=1;
		#60;
		Ctrl=2;
		#60;
		Ctrl=3;
		#60;
		Ctrl=4;
		#60;
		Ctrl=5;
		#60;
		Ctrl=6;
		#60;
		Ctrl=7;
	end
      
endmodule

