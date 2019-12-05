`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:55:34 04/10/2016 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [7:0] A ,
	input [7:0] B ,
	input [2:0] Ctrl,
	output[7:0] F);
	
	wire [7:0] apb;
	wire [7:0] amb;
	wire [7:0] ap1;
	wire [7:0] a;
	wire [7:0] aandb;
	wire [7:0] aorb;
	wire [7:0] axorb;
	wire [7:0] anot;
	wire [7:0] muxf;
	
	
	FA FAAPB (.A(A[7:0]),.B(B[7:0]),.Cin(0),.F(apb[7:0]));
	FA FAAMB (.A(A[7:0]),.B(~B[7:0]),.Cin(1),.F(amb[7:0]));
	FA FAAP1 (.A(A[7:0]),.B(00000001),.Cin(0),.F(ap1[7:0]));
	And and1 (.A(A[7:0]),.B(B[7:0]),.F(aandb[7:0]));
	Or or1 ( .A(A[7:0]),.B(B[7:0]),.F(aorb[7:0]));
	Xor xor1 (.A(A[7:0]),.B(B[7:0]),.F(axorb[7:0]));
	NotA nota1 (.A(A[7:0]),.F(anot[7:0]));
	
	mux1 MUX(.CTRL(Ctrl[2:0]),.APB(apb[7:0]),.AMB(amb[7:0]),.AP1(ap1[7:0]),.A(A[7:0]),.AND(aandb [7:0]),.OR(aorb[7:0]),.XOR(axorb[7:0]),.NOTA(anot[7:0]),.F(muxf[7:0]));
	
	assign F[7:0] = muxf[7:0];
	
endmodule


module FA(
	input  [7:0] A,
   input  [7:0] B,
	input Cin,
	output [7:0] F);
	

	 wire [7:0] coutb;
	 

	adder adB0 (.A(A[0]),.B(B[0]),.Cin(Cin),.S(F[0]),.Cout(coutb[0]));
	adder adB1 (.A(A[1]),.B(B[1]),.Cin(coutb[0]),.S(F[1]),.Cout(coutb[1]));
	adder adB2 (.A(A[2]),.B(B[2]),.Cin(coutb[1]),.S(F[2]),.Cout(coutb[2]));
	adder adB3 (.A(A[3]),.B(B[3]),.Cin(coutb[2]),.S(F[3]),.Cout(coutb[3]));
	adder adB4 (.A(A[4]),.B(B[4]),.Cin(coutb[3]),.S(F[4]),.Cout(coutb[4]));
	adder adB5 (.A(A[5]),.B(B[5]),.Cin(coutb[4]),.S(F[5]),.Cout(coutb[5]));
	adder adB6 (.A(A[6]),.B(B[6]),.Cin(coutb[5]),.S(F[6]),.Cout(coutb[6]));
	adder adB7 (.A(A[7]),.B(B[7]),.Cin(coutb[6]),.S(F[7]),.Cout(coutb[7]));
	
	
endmodule

module adder(
    input A,
    input B,
    input Cin,
	 output reg S,
    output reg Cout
    );
	 
	 always @ * begin
	 //S = ~B & (A^B) | B & (A^~B);
	 S = (~A & ~B & Cin)+ (~A & B & ~Cin) + (A & ~B & ~Cin) + (A & B & Cin);
	 //Cout = A&B&Cin + A & ((B^Cin) + (B & Cin));
	 Cout = (B & Cin) + (A & Cin) + (A & B);
	
	 end


endmodule


 module And(
	input [7:0] A,
	input [7:0] B,
	output[7:0]F
 );
	assign F[0] = A[0] & B[0];
	assign F[1] = A[1] & B[1];
	assign F[2] = A[2] & B[2];
	assign F[3] = A[3] & B[3];
	assign F[4] = A[4] & B[4];
	assign F[5] = A[5] & B[5];
	assign F[6] = A[6] & B[6];
	assign F[7] = A[7] & B[7];
	
 endmodule
 
module Or(
	input [7:0] A,
	input [7:0] B,
	output[7:0] F 
);
	assign F[0] = A[0] | B[0];
	assign F[1] = A[1] | B[1];
	assign F[2] = A[2] | B[2];
	assign F[3] = A[3] | B[3];
	assign F[4] = A[4] | B[4];
	assign F[5] = A[5] | B[5];
	assign F[6] = A[6] | B[6];
	assign F[7] = A[7] | B[7];

		
endmodule 
 
 module Xor(
	input [7:0] A,
	input [7:0] B,
	output[7:0] F 
 );
	assign F[0] = A[0] ^ B[0];
	assign F[1] = A[1] ^ B[1];
	assign F[2] = A[2] ^ B[2];
	assign F[3] = A[3] ^ B[3];
	assign F[4] = A[4] ^ B[4];
	assign F[5] = A[5] ^ B[5];
	assign F[6] = A[6] ^ B[6];
	assign F[7] = A[7] ^ B[7];
 
 endmodule
 
 module NotA(
	input [7:0] A,
	output[7:0] F 
	);
	assign F[0] = ~A[0];
	assign F[1] = ~A[1];
	assign F[2] = ~A[2];
	assign F[3] = ~A[3];
	assign F[4] = ~A[4];
	assign F[5] = ~A[5];
	assign F[6] = ~A[6];
	assign F[7] = ~A[7];
 
 endmodule
 
 
 module mux1(
	input [2:0] CTRL,
	input [7:0] APB ,
	input [7:0] AMB ,
	input [7:0] AP1 ,
	input [7:0] A ,
	input [7:0] AND ,
	input [7:0] OR ,
	input [7:0] XOR ,
	input [7:0] NOTA ,
	output [7:0]F 
	);
	
	assign F[7:0]= ( CTRL== 0) ? APB[7:0]:
						( CTRL== 1) ? AMB[7:0]:
						( CTRL== 2) ? AP1[7:0]:
						( CTRL== 3) ? A[7:0]:
						( CTRL== 4) ? AND[7:0]:
						( CTRL== 5) ? OR[7:0]:
						( CTRL== 6) ? XOR[7:0]:
						( CTRL== 7) ? NOTA[7:0]: 8'b00000000;
	
endmodule
