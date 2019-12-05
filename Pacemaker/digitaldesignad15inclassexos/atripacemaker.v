`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////
module atripacemaker(
    input clk,
    input rst,
    input sa,
    input sv,
    output pa,
    output pv
    );
	 
	 parameter ResetTimerA 	= 3'b000;
	 parameter WaitA 			= 3'b001;
	 parameter PaceA 			= 3'b010;
	 parameter ResetTimerV 	= 3'b011;
	 parameter WaitV 			= 3'b100;
	 parameter PaceV 			= 3'b101;

	 reg [2:0] STATE, NXT_STATE;
	 reg [4:0] TimerA, TimerV;
	 
	 wire ta, tv;
	 wire za, zv;
	 
	 assign za = (TimerA == 0);
	 assign zv = (TimerV == 0);
	 
	 always @ (posedge clk) begin
		if(rst|ta) 
			TimerA <= 25;  // CountDown Timer
		else 
			TimerA <= TimerA - 1;
	 end
	 
	 always @ (posedge clk) begin
		if(rst|tv) 
			TimerV <= 25;  // CountDown Timer
		else 
			TimerV <= TimerV - 1;	
	 end
	 
	 // Decode Outputs of the FSM as a function
	 // of the STATE 
	 assign ta = (STATE == ResetTimerA);
	 assign tv = (STATE == ResetTimerV);
	 assign pa = (STATE == PaceA);
	 assign pv = (STATE == PaceV)? 1'b1 : 1'b0;
	 
	 // Combinational part of the FSM
	 // State Transition Logic
	 always @ * begin
		case (STATE) 
			ResetTimerA: NXT_STATE = WaitA; // Free Transition
			
			WaitA: begin
						if(sa)
							NXT_STATE = ResetTimerV;
						else if (~sa & za)
							NXT_STATE = PaceA;
						else
							NXT_STATE = WaitA;
					 end
			PaceA: NXT_STATE = ResetTimerV;
			
			ResetTimerV: NXT_STATE = WaitV;
		
			WaitV: NXT_STATE = (sv) ? ResetTimerA : 
									 (~sv & zv) ? PaceV :
									              WaitV ;
			
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
