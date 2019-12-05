`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:51:26 05/10/2016 
// Design Name: 
// Module Name:    FP 
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
module FP(
input [5:0] pillc,
input start, //si funciona si lo apagas
input clk,
input rst, //si funciona 
output [15:0]countp //te da resultados raros fuera de 1
    );
wire [5:0] outrega;
wire [15:0] outregb;
wire [5:0] outctr;
wire [15:0] sum;
wire changenum;

regi rega(.clk(clk),.rst(rst),.D(pillc),.Q(outrega));
ctr ctr1(.clk(clk),.rst(rst),.en(start),.rega(outrega),.count(outctr));
assign changenum= (pillc==outrega);
adder adder1 (.a(outctr),.b(outregb),.c(sum));
regib regb(.clk(clk),.rst(rst),.en(start),.D(sum),.changenum(changenum),.Q(outregb)); 
assign countp= outregb;
endmodule



module adder (
	input [5:0]a,
	input [15:0] b,
	output [15:0]c);
	assign c= a+b;
	endmodule


module regi(
    input clk,
    input rst,
    input [5:0] D,
    output reg [5:0] Q
    );
	always @ (posedge clk) begin
		if (rst)   
			Q <= 0;
		else 
			Q <= D;
	end		
endmodule

module regib(
    input clk,
    input rst,
	 input en,
    input [15:0] D,
	 input changenum,
    output reg [15:0] Q
    );
	always @ (posedge clk) begin
		if (rst|~changenum) //si funciona  
			Q <= 0;
		else if(en)
			Q <= D;
	end		
endmodule

module ctr(
    input clk,
    input rst,
	 input en,
	 input [5:0] rega,
    output reg [5:0] count
    );
	reg [5:0] Z; 
	wire oconvb;
	always @ * begin //funcion de la valvula
		if (en&(~oconvb))
		Z= count + 1;
		else
		Z=count;
	end
	assign oconvb = en&(count == rega);//cosa que mueve botellas
	always @ (posedge clk) begin //funcion del counter
		if (rst | oconvb)
		count <= 0;
		else if(en)
		count <= Z;
	end
endmodule


