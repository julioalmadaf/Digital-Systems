`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:55:14 03/17/2016 
// Design Name: 
// Module Name:    decoderhld 
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
module decoderhld(
    input [2:0] A,
    output reg [7:0] Y,
    input EN
    );
	 always @ * begin
		if(EN==1'b0) begin
		Y=8'b1111_1111;
		end else begin
		case (A)
		3'd0: Y=8'b11111110;
		3'd1: Y=8'b11111101;
		3'd2: Y=8'b11111011;
		3'd3: Y=8'b11110111;
		3'd4: Y=8'b11101111;
		3'd5: Y=8'b11011111;
		3'd6: Y=8'b10111111;
		3'd7: Y=8'b01111111;
		endcase
		end
		end
endmodule
