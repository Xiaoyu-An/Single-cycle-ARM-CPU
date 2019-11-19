`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2019 07:16:50 PM
// Design Name: 
// Module Name: MUX_2_1_tb
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


module MUX_2_1_tb();

    reg [63:0] ReadData1,ReadData2, extendAddr;
	
	reg ALUSrc;		
	wire [63:0] A,B;
	
MUX_2_1 uut(
            .ReadData1(ReadData1), 
            .ReadData2(ReadData2), 
            .extendAddr(extendAddr), 
            .ALUSrc(ALUSrc), 
            .A(A),
            .B(B)
            );

	initial
	   begin
	       ReadData1 = 64'b01;
	       ReadData2 = 64'b10;
	       extendAddr = 64'b01;
	       ALUSrc = 0;
	       #50;
	       ReadData1 = 64'b111;
	       ReadData2 = 64'b101;
	       extendAddr = 64'b011;
	       ALUSrc = 1;
	       #50;
	       ReadData1 = 64'b11;
	       ReadData2 = 64'b0;
	       extendAddr = 64'b011;
	       ALUSrc = 0;
	       #50;
	       ReadData1 = 64'b1011;
	       ReadData2 = 64'b011;
	       extendAddr = 64'b1;
	       ALUSrc = 1;
	       #50;
	       $finish;
	       
	   end


endmodule
