`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:12:56 05/11/2016
// Design Name:   FP
// Module Name:   C:/Users/JulioCesar/OneDrive/Documentos/4to Semestre/Sistemas Digitales 2016/FinalP/fptb.v
// Project Name:  FinalP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fptb;

	// Inputs
	reg [5:0] pillc;
	reg start;
	reg clk;
	reg rst;

	// Outputs
	wire [9:0] countp;

	// Instantiate the Unit Under Test (UUT)
	FP uut (
		.pillc(pillc), 
		.start(start), 
		.clk(clk), 
		.rst(rst), 
		.countp(countp)
	);

	initial begin
		// Initialize Inputs
		pillc = 0;
		start = 1;
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
		rst =0;
		  #20;
		  pillc=1;
		  #50;
		  start=0;
		  #50;
		  start=1;
		  #150;
		  rst=1;
		// Add stimulus here

	end
    initial begin
		forever #5 clk = ~clk;
		end
endmodule

