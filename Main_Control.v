`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2019 01:05:55 PM
// Design Name: 
// Module Name: Main_Control
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

module Main_Control(Instruct, Reg2Loc,Uncondbranch,Branch,MemRead, MemtoReg, ALUOp, MemWrite,ALUSrc,RegWrite);
    
    input [31:0] Instruct;
    output reg Reg2Loc,Uncondbranch,Branch,MemRead, MemtoReg, MemWrite,ALUSrc,RegWrite;
    output reg [2:0] ALUOp;

    reg [10:0] Instruction_in;
   /*
    Instruction_Memory uut6(.Instruction(INS));
    
    */
    parameter BRANCHH = 11'b00010100000,
          AND = 11'b10001010000,
          ADD = 11'b10001011000,
          ORR = 11'b10101010000,
          CBNZ = 11'b10110100000,
          SUB = 11'b11001011000,           
          MOVK = 11'b11110010100,
          STUR = 11'b11111000000,
          LDUR = 11'b11111000010;
     /*    
  initial
    begin
        Reg2Loc = 0;
        ALUSrc = 0;
        MemtoReg = 0;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        ALUOp = 3'b000;
        Uncondbranch = 1'b1;
        MOVKop = 0;
    
    end
          */
           
   always @ (*)
        begin
            Instruction_in = Instruct[31:21];
            case(Instruction_in)
                BRANCHH:
                    begin
                        Reg2Loc <= 0;
                        ALUSrc <= 0;
                        MemtoReg <= 0;
                        RegWrite <= 0;
                        MemRead <= 0;
                        MemWrite <= 0;
                        Branch <= 0;
                        Uncondbranch <= 1'b1;
                        ALUOp <= 3'b011;
                      
                     end
                AND:
                    begin
                        Reg2Loc <= 0;
                        ALUSrc <= 0;
                        MemtoReg <= 0;
                        RegWrite <= 1'b1;
                        MemRead <= 0;
                        MemWrite <= 0;
                        Branch <= 0;
                        Uncondbranch <= 0;
                        ALUOp <= 3'b000;
                    end
                ADD:
                    begin
                        Reg2Loc <= 0;
                        ALUSrc <= 0;
                        MemtoReg <= 0;
                        RegWrite <= 1'b1;
                        MemRead <= 0;
                        MemWrite <= 0;
                        Branch <= 0;
                        Uncondbranch <= 0;
                        ALUOp <= 3'b101;
                    end
                ORR:
                    begin
                        Reg2Loc <= 0;
                        ALUSrc <= 0;
                        MemtoReg <= 0;
                        RegWrite <= 1'b1;
                        MemRead <= 0;
                        MemWrite <= 0;
                        Branch <= 0;
                        Uncondbranch <= 0;
                        ALUOp <= 3'b001;
                    end
                 CBNZ:
                    begin
                        Reg2Loc <= 1;
                        ALUSrc <= 0;
                        MemtoReg <= 0;
                        RegWrite <= 0;
                        MemRead <= 0;
                        MemWrite <= 0;
                        Branch <= 1'b1;
                        Uncondbranch <= 0;
                        ALUOp <= 3'b100;
                     end   
                 SUB:
                    begin
                        Reg2Loc <= 0;
                        ALUSrc <= 0;
                        MemtoReg <= 0;
                        RegWrite <= 1'b1;
                        MemRead <= 0;
                        MemWrite <= 0;
                        Branch <= 0;
                        Uncondbranch <= 0;
                        ALUOp <= 3'b110;
                    end
                 MOVK:
                    begin
                        Reg2Loc <= 0;
                        ALUSrc <= 1'b1;
                        MemtoReg <= 0;
                        RegWrite <= 1'b1;
                        MemRead <= 0;
                        MemWrite <= 0;
                        Branch <= 0;
                        Uncondbranch <= 0;
                        ALUOp <= 3'b111;
                    end
                    
                 LDUR:
                    begin
                        Reg2Loc <= 0;
                        ALUSrc <= 1'b1;
                        MemtoReg <= 1'b1;
                        RegWrite <= 1'b1;
                        MemRead <= 1'b1;
                        MemWrite <= 0;
                        Branch <= 0;
                        Uncondbranch <= 0;
                        ALUOp <= 3'b101;
                    end
                 STUR:
                    begin
                        Reg2Loc <= 1'b1;
                        ALUSrc <= 1'b1;
                        MemtoReg <= 0;
                        RegWrite <= 0;
                        MemRead <= 0;
                        MemWrite <= 1'b1;
                        Branch <= 0;
                        Uncondbranch <= 0;
                        ALUOp <= 3'b101;
                    end
                 default: 
                    begin
                        Reg2Loc <= 0;
                        ALUSrc <=0;
                        MemtoReg <= 0;
                        RegWrite <= 0;
                        MemRead <= 0;
                        MemWrite <= 0;
                        Branch <= 0;
                        Uncondbranch <= 0;
                        ALUOp <= 0;
                    end
           endcase
     end      
endmodule