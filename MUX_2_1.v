`timescale 1ns / 1ps


module MUX_2_1 (ReadData1, ReadData2, extendAddr, ALUSrc, A,B);

	input [63:0] ReadData1,ReadData2, extendAddr;
	//decide lengths of the input and output depending on parameter W 
	input ALUSrc;		
	output [63:0] A,B;
	
	assign A = ReadData1;
	assign B = (ALUSrc == 1) ? extendAddr : ReadData2;
	

endmodule
