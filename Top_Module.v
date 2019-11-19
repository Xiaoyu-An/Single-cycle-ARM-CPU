`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2019 02:14:03 PM
// Design Name: 
// Module Name: Top_Module
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


module Top_Module(clk, rst,InstructionOUT,ReadData1OUT,ReadData2OUT,extendAddrOUT,ALU_OUT,ZeroFlagOUT,DMOUT,ALUOpOUT,NewPCOUT,
                 MUX6OUT,PCOUT,Reg2LocOUT,UncondbranchOUT,BranchOUT,MemReadOUT, MemtoRegOUT, MemWriteOUT,ALUSrcOUT,RegWriteOUT);
    input clk,rst;
    output [31:0] InstructionOUT; 
  
    output [63:0] PCOUT;
    output [63:0] extendAddrOUT;
    output [2:0] ALUOpOUT;
    output [63:0] MUX6OUT;
    output [63:0] NewPCOUT;
    output [63:0] ReadData1OUT,ReadData2OUT;
    
    output  Reg2LocOUT,UncondbranchOUT,BranchOUT,MemReadOUT, MemtoRegOUT, MemWriteOUT,ALUSrcOUT,RegWriteOUT;
    output [63:0] ALU_OUT,DMOUT;
    output ZeroFlagOUT;
    
    reg [63:0] PC;
    
    wire Reg2Loc, Uncondbranch, Branch,MemRead, MemtoReg,  MemWrite, ALUSrc, RegWrite;
    wire [2:0] ALUOp;
    wire [63:0] Address;
    wire [31:0] Instruction;
    wire ZeroFlag;
    wire [63:0] InstrAddr, NewPC;
    
    wire [63:0] A,B;
     
    wire [63:0] mux6out;
    wire [63:0] ALU_Out; 
    wire [63:0] DataAddr;
    wire [63:0] DMout;
    
    wire [4:0] ReadSelect1, ReadSelect2, WriteSelect;
    wire WriteEnable;
    wire [63:0] WriteData,ReadData1,ReadData2;
    
    wire [63:0] extendAddr;
    
initial PC <= 0;                   
    
Instruction_Memory uut1(
                        .Address(PC),
                        .Instruction(Instruction)
                        );

MUX_2_1_5 uut2(
            .Instruction(Instruction), 
            .Reg2Loc(Reg2Loc), 
            .ReadSelect1(ReadSelect1), 
            .ReadSelect2(ReadSelect2),
            .WriteSelect(WriteSelect)
            ); 
                      
Register_File uut3(
                    .ReadSelect1(ReadSelect1), 
                    .ReadSelect2(ReadSelect2), 
                    .WriteSelect(WriteSelect), 
                    .WriteData(mux6out), 
                    .WriteEnable(RegWrite), 
                    .ReadData1(ReadData1), 
                    .ReadData2(ReadData2), 
                    .clk(clk), 
                    .rst(rst)
                    );   

MUX_2_1 uut4(
            .ReadData1(ReadData1), 
            .ReadData2(ReadData2), 
            .extendAddr(extendAddr), 
            .ALUSrc(ALUSrc),
            .A(A),
            .B(B)
            );  
   
Main_Control uut6(
                    .Instruct(Instruction), 
                    .Reg2Loc(Reg2Loc),
                    .Uncondbranch(Uncondbranch),
                    .Branch(Branch),
                    .MemRead(MemRead), 
                    .MemtoReg(MemtoReg), 
                    .ALUOp(ALUOp), 
                    .MemWrite(MemWrite),
                    .ALUSrc(ALUSrc),
                    .RegWrite(RegWrite)
                    );
                    
Sign_extend uut7(
                .in(Instruction),
                .out(extendAddr)
                );      



ALU_64 uut9(
            .A(A),
            .B(B),
            .ALU_Opcode(ALUOp),
            .ALU_Out(ALU_Out),
            .Z(ZeroFlag)
            );
            
Data_memory uut10(
            .clk(clk), 
            .rst(rst),
            .Addr(ALU_Out), 
            .WriteData(ReadData2), 
            .MemWrite(MemWrite),
            .MemRead(MemRead), 
            .DMout(DMout)
            );
            
MUX_To_Reg uut11(
            .in0(DMout), 
            .in1(ALU_Out), 
            .s0(MemtoReg), 
            .out(mux6out)
            );           
            
ProgCounter uut0(
                .Branch(Branch),
                .Uncondbranch(Uncondbranch),
                .ZeroFlag(ZeroFlag),
                .Addr(extendAddr), 
                .PC(PC),
                .NewPC(NewPC)
                );      
                
 always @(posedge clk) 
    begin
        PC = NewPC;               
    end                                            

assign InstructionOUT = Instruction;

assign ReadData1OUT = ReadData1;
assign ReadData2OUT = ReadData2;

assign MUX6OUT = mux6out;
assign PCOUT = PC;
assign NewPCOUT = NewPC;
assign extendAddrOUT = extendAddr;

assign Reg2LocOUT = Reg2Loc;
assign UncondbranchOUT = Uncondbranch;
assign BranchOUT = Branch;
assign MemReadOUT = MemRead;
assign MemtoRegOUT = MemtoReg;

assign MemWriteOUT = MemWrite;
assign ALUSrcOUT = ALUSrc;
assign RegWriteOUT = RegWrite;
assign ALU_OUT = ALU_Out;
assign ALUOpOUT = ALUOp;
assign ZeroFlagOUT = ZeroFlag;
assign DMOUT = DMout;




    
endmodule
