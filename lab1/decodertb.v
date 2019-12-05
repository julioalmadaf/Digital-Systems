`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:10:04 03/17/2016
// Design Name:   decoderbooleq
// Module Name:   C:/Verilog/lab1/decodertb.v
// Project Name:  lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: decoderbooleq
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module decodertb;

	// Inputs
	reg [2:0] A;
	reg EN;

	// Outputs
	wire [7:0] Y;
	wire [7:0] YHDL;
	// Instantiate the Unit Under Test (UUT)
	decoderbooleq uut0(
		.A(A), 
		.Y(Y), 
		.EN(EN)
	);
	decoderhld uut1 (
		.A(A), 
		.Y(YHDL), 
		.EN(EN)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		EN = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		EN=1;
		A=0;
		#20;
		A=3;
		#20;
		A=6;
		#20;
		EN=0;
		A=1;
		#20;
		A=5;
		#20;
		A=7;
		#20;
		A=2;
	end
      
endmodule

