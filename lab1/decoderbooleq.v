`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:31:38 03/17/2016 
// Design Name: 
// Module Name:    decoderbooleq 
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
module decoderbooleq(
    input [2:0] A,
    output reg [7:0] Y,
    input EN
    );
	 always @ * begin
	 Y[0] = ~(~A[0]&~A[1]&~A[2]);
	 Y[1] = ~(A[0]&~A[1]&~A[2]);
	 Y[2] = ~(~A[0]&A[1]&~A[2]);
	 Y[3] = ~(A[0]&A[1]&~A[2]);
	 Y[4] = ~(~A[0]&~A[1]&A[2]);
	 Y[5] = ~(A[0]&~A[1]&A[2]);
	 Y[6] = ~(~A[0]&A[1]&A[2]);
	 Y[7] = ~(A[0]&A[1]&A[2]);
	 Y = Y | {8{~EN}};
	 end
	 
endmodule
