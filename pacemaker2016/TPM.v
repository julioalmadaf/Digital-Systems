`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:41:40 05/02/2016
// Design Name:   PM
// Module Name:   C:/Users/JulioCesar/OneDrive/Documentos/4to Semestre/Sistemas Digitales/pacemaker2016/TPM.v
// Project Name:  pacemaker2016
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TPM;

	// Inputs
	reg clk;
	reg rst;
	reg sa;
	reg sv;

	// Outputs
	wire pa;
	wire pv;

	// Instantiate the Unit Under Test (UUT)
	PM uut (
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
      rst=0;
		// Add stimulus here
		#20;
		sa=1;
		#20;
		sa=0;
		#40;
		sv=1;
		#40
		sv=0;
		#200;
		sv=1;
		#50;
		sv=0;
		
	end
      initial begin 
		forever #1 clk = ~clk;
		end
endmodule

