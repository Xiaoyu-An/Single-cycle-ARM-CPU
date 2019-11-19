`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2019 10:29:11 AM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
    parameter BITSIZE = 32;
	parameter REGSIZE = 64;
	
    reg [REGSIZE-1:0] A;
    reg [REGSIZE-1:0] B;
    reg [3:0] ALU_Opcode;
    wire [REGSIZE-1:0]ALU_Out;
    wire Z;
    
    
ALU_64 uut8(
             .A(A),
             .B(B),
             .ALU_Opcode(ALU_Opcode),
             .ALU_Out(ALU_Out),
             .Z(Z)
            );
        
     initial
        begin
            A = 64'b00;
            B = 64'b00;
            #50;
            A = 64'b011;
            B=  64'b001;
            ALU_Opcode = 4'b001;
            #50;
            ALU_Opcode = 4'b010;
            #50;
            ALU_Opcode = 4'b011;
            #50;
            ALU_Opcode = 4'b100;
            #50;
            ALU_Opcode = 4'b101;
            #50;
            ALU_Opcode = 4'b110;
            #50;
            ALU_Opcode = 4'b111;
            #50;
            B = 64'b00;
            ALU_Opcode = 4'b1000;
            #50;
            $finish;



        end





endmodule
