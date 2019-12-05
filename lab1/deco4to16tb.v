`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:41:44 03/17/2016
// Design Name:   deco4to16
// Module Name:   C:/Verilog/lab1/deco4to16tb.v
// Project Name:  lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: deco4to16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module deco4to16tb;

	// Inputs
	reg [3:0] A;
	reg EN;

	// Outputs
	wire [15:0] Y;

	// Instantiate the Unit Under Test (UUT)
	deco4to16 uut (
		.A(A), 
		.EN(EN), 
		.Y(Y)
	);
	reg [15:0] Y_G;
	initial begin
		// Initialize Inputs
		A = 0;
		EN = 0;
		Y_G = 0;
		// Wait 100 ns for global reset to finish
		#30;
        
		// Add stimulus here
		EN = 1;
		A=5;
		#10;
		A=2;
		#10;
		A=10;
		#10;
		A=15;
		#10;
		A=8;
		#5;
		EN=0;
		#10;
		EN=1;
		A=3;
		#10;
		A=11;
		#10;
		A=14;
		#10;
		A=7;
		#10;
		A=0;
		#10;
		EN=0;
		
		end
		always @ (A,EN) begin : checker
		reg error;
		#1;
		Y_G= ~((1'b1&EN)<<A);
		$display("Y_REF = %d", Y_G);
		$display("Y_UUT = %d", Y);
		error = (Y_G != Y);
		if(error) $display("ERROR expected: %b, found: %b", Y_G,Y);
		$display("************");
		end : checker
      
endmodule

