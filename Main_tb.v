`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2019 04:36:15 PM
// Design Name: 
// Module Name: Main_tb
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


module Main_tb();
   reg [31:0] Instruct;
   wire Reg2Loc,Uncondbranch,Branch,MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, MOVKop;
   wire [3:0] ALUOp;
    
Main_Control uut6(
                .Instruct(Instruct), 
                .Reg2Loc(Reg2Loc),
                .Uncondbranch(Uncondbranch),
                .Branch(Branch),
                .MemRead(MemRead), 
                .MemtoReg(MemtoReg), 
                .ALUOp(ALUOp), 
                .MemWrite(MemWrite),
                .ALUSrc(ALUSrc),
                .RegWrite(RegWrite),
                .MOVKop(MOVKop)
                );

initial 
    begin
        Instruct = 32'b0;
        #50;
        Instruct = 32'b00010100000000000000000000000000;
        #50;
        Instruct = 32'b10001010000000000000000000000000;
        #50;
        Instruct = 32'b10001011000000000000000000000000;
        #50;
        Instruct = 32'b10101010000000000000000000000000;
        #50;
        Instruct = 32'b10110100000000000000000000000000;
        #50;
        Instruct = 32'b11001011000000000000000000000000;
        #50;
        Instruct = 32'b11110010110000000000000000000000;
        #50;
        Instruct = 32'b11111000000000000000000000000000;
        #50;
        Instruct = 32'b11111000010000000000000000000000;
        #100;
        $finish;
        
    
    end   


endmodule