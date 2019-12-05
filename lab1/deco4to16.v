`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:32:24 03/17/2016 
// Design Name: 
// Module Name:    deco4to16 
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
module deco4to16(
    input [3:0] A,
	 input EN,
    output [15:0] Y
    );
	 
	 wire en0, en1;
	 assign en0= ~A[3] & EN;
	 assign en1= A[3] & EN;
	 
	 decoderbooleq decolsb(.A(A[2:0]),
								  .EN(en0),
								  .Y(Y[7:0]));
    decoderhld decomsb(.A(A[2:0]),
							  .EN(en1),
							  .Y(Y[15:8]));
 	 
	 
	
endmodule
