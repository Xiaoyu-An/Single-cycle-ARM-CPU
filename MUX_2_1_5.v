`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2019 03:41:18 PM
// Design Name: 
// Module Name: MUX_2_1_5
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



/*
module MUX_2_1_5  (in0, in1, s0, out);

	input s0;
	//decide lengths of the input and output depending on parameter W 
	input [4:0] in0, in1;		
	output reg [4:0] out;
	
	//conditional assignment -> s0 selects an input
	always @ (*)
	begin
		if(s0 == 1) begin
			out = in1;
		end else begin
			out = in0;
		end
	end
	//assign out = s0 ? in1 : in0;

endmodule
*/

module MUX_2_1_5  (Instruction,Reg2Loc,ReadSelect1,ReadSelect2,WriteSelect);

	input [31:0] Instruction;
	//decide lengths of the input and output depending on parameter W 
	input Reg2Loc;		
	output [4:0] ReadSelect1,ReadSelect2,WriteSelect;
	
	parameter MOVK = 11'b11110010100;
	
	assign ReadSelect1 = (Instruction[31:21] == MOVK) ? Instruction[4:0] : Instruction[9:5];
	assign ReadSelect2 = (Reg2Loc == 1) ? Instruction[4:0] : Instruction[20:16];
	assign WriteSelect = Instruction[4:0];

    


endmodule