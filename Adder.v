module FA(
	input A,
	input B,
	input Cin,
	output reg Sum,
	output reg Cout
	);

	/*wire A_B;
	wire A_Cin;
	wire B_Cin;
	wire AB_or_ACin;
	wire A_x_B;
	wire A_x_B_Cin;
	
	assign A_B = A & B;
	assign A_Cin = A & Cin;
	assign B_Cin = B & Cin;
	assign AB_or_ACin = A_B + A_Cin;
	assign Cout = AB_or_ACin + B_Cin;
	assign Sum = (A ^ B ) ^ Cin;
	 */

	always @ * begin 
		Sum = A ^ C ^ Cin;
		Cout = (A & B) | (B & Cin) | (A & Cin);
	end
endmodule

module FA4b(
	input A [3:0],
	input B [3:0],
	input Cin,
	output S[3:0],
	output Cout
	);

	/*wire x;
	wire y;
	wire z;
	*/
	
	wire x,y,z;
	
	FA FA0 (.A(A[0]),.B(B[0]),.Cin(Cin),.Sum(S[0]),.Cout(x));
	FA FA1 (.A(A[1]),.B(B[1]),.Cin(x),.Sum(S[1]),.Cout(y));
	FA FA2 (.A(A[2]),.B(B[2]),.Cin(y),.Sum(S[2]),.Cout(z));
	FA FA3 (.A(A[3]),.B(B[3]),.Cin(z),.Sum(S[3]),.Cout(Cout));
	
endmodule