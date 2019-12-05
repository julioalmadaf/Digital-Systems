`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:01:00 04/10/2016 
// Design Name: 
// Module Name:    ALUU 
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
module ALUU(z,a,b,s);

input [7:0]a,b;
input [2:0]s;

output reg [7:0]z;

always@(s,a,b)

begin
case(s)

3'b000: z = a+b;

3'b001: z = a-b;

3'b010: z = a+1;

3'b011: z = a;

3'b100: z = a&b;

3'b101: z = a|b;

3'b110: z = a^b;

3'b111: z = ~a;

endcase

end
endmodule

   
