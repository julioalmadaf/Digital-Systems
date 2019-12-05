`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:30:36 11/09/2015
// Design Name:   atripacemaker
// Module Name:   C:/Verilog/pacemaker/pacemaker_test.v
// Project Name:  pacemaker
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: atripacemaker
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pacemaker_test;

	// Inputs
	reg clk;
	reg rst;
	reg sa;
	reg sv;

	// Outputs
	wire pa;
	wire pv;

	// Instantiate the Unit Under Test (UUT)
	atripacemaker uut (
		.clk(clk), 
		.rst(rst), 
		.sa(sa), 
		.sv(sv), 
		.pa(pa), 
		.pv(pv)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		sa = 0;
		sv = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rst = 0;
		// Add stimulus here

		#1000;
		sa = 1;
		#1000;
		sv = 1;
		
		#1000;
		
		sa = 0;
		sv = 0;
		
		#2000;
		sv = 1;
		
		#2000;
		sv = 0;
		
	end
   initial begin
		forever #5 clk = ~clk;
	end
endmodule

