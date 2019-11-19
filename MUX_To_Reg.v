`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2019 06:28:33 PM
// Design Name: 
// Module Name: MUX_To_Reg
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
module MUX_To_Reg  (in0, in1, s0, out);

	input s0;
	//decide lengths of the input and output depending on parameter W 
	input [63:0] in0, in1;		
	output reg [63:0] out;
	
	//conditional assignment -> s0 selects an input
	always @ (*)
	begin
		if(s0 == 0) begin
			out = in1;
		end 
		else begin
			out = in0;
		end
	end
	//assign out = s0 ? in1 : in0;

endmodule