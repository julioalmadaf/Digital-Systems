`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:37:26 05/02/2016 
// Design Name: 
// Module Name:    PM 
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
module PM(
    input clk,
    input rst,
    input sa,
    input sv,
    output pa,
    output pv
    );
	 //estados
	 parameter ResetTimerA 	= 3'b000;
	 parameter WaitA 	= 3'b001;
	 parameter PaceA 	= 3'b010;
	 parameter ResetTimerV 	= 3'b011;
	 parameter WaitV 	= 3'b100;
	 parameter PaceV 	= 3'b101;
	
	 reg [2:0] STATE, NXT_STATE; //cables de los estados
	 reg [4:0] TimerA;
	 reg [5:0]TimerV; // son del tama�o de los bits que ocupan
	 
	 wire tald, tvld,taen,tven;
	 wire za, zv;
	 //mandan 1 cuando se acaba el tiempo
	 assign za = (TimerA == 0);
	 assign zv = (TimerV == 0);
	 
	 always @ (posedge clk) begin
		if(rst|tald) 
			TimerA <= 30;  // CountDown Timer
		else if(taen)
			TimerA <= TimerA - 1;
	 end
	 
	 always @ (posedge clk) begin
		if(rst|tvld) 
			TimerV <= 45;  // CountDown Timer
		else if(tven)
			TimerV <= TimerV - 1;	
	 end
	 
	 // Decode Outputs of the FSM as a function
	 // of the STATE 
	 assign tald = (STATE == ResetTimerA);
	 assign tvld = (STATE == ResetTimerV);
	 assign taen = (STATE == WaitA);
	 assign tven = (STATE == WaitV);
	 assign pa = (STATE == PaceA);
	 assign pv = (STATE == PaceV)? 1'b1 : 1'b0;
	 
	 // Combinational part of the FSM
	 // State Transition Logic
	 always @ * begin
		case (STATE) 
			ResetTimerA: NXT_STATE = WaitA; // Free Transition
			
			WaitA: begin
			if(sa)
				NXT_STATE = ResetTimerV;//late corazon y pasa a ventriculo
			else if (~sa & za)
				NXT_STATE = PaceA;// si no late corazon y se acaba timer pasa a pacea
			else
				NXT_STATE = WaitA;//permanece en waita
			end
			
			PaceA: NXT_STATE = ResetTimerV;//manda se�al al corazon y pasa a resettimerventriculo
			
			ResetTimerV: NXT_STATE = WaitV;//pasa directo
		
			WaitV: NXT_STATE = (sv) ? ResetTimerA : 
				(~sv & zv) ? PaceV :WaitV ;
			
			PaceV: NXT_STATE = ResetTimerA;
			default : NXT_STATE = ResetTimerA;
		endcase
	 end
	 
	 
	 // Sequential part of the FSM
	 // Basically STATE gets NXT_STATE every clk cycle.
	 always @ (posedge clk) begin
		if (rst)
			STATE <= ResetTimerA;
		else
			STATE <= NXT_STATE;
	 end

endmodule
