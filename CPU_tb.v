`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2019 04:34:34 PM
// Design Name: 
// Module Name: CPU_tb
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


module CPU_tb();

    reg clk,rst;
    wire [31:0] InstructionOUT; 
    wire [2:0] ALUOpOUT;
    wire [63:0] NewPCOUT;
    wire [63:0] PCOUT;
    wire [63:0] extendAddrOUT;
    wire [63:0] MUX6OUT;
    wire [63:0] ReadData1OUT,ReadData2OUT;
    
    wire  Reg2LocOUT,UncondbranchOUT,BranchOUT,MemReadOUT, MemtoRegOUT, MemWriteOUT,ALUSrcOUT,RegWriteOUT;
    wire [63:0] ALU_OUT,DMOUT;
    wire ZeroFlagOUT;
    
    
Top_Module myuut (
                .clk(clk),
                .rst(rst),
                .InstructionOUT(InstructionOUT),
                .NewPCOUT(NewPCOUT),
                .PCOUT(PCOUT),
                .extendAddrOUT(extendAddrOUT),
             
                .MUX6OUT(MUX6OUT),
                .ReadData1OUT(ReadData1OUT),
                .ReadData2OUT(ReadData2OUT),
                .Reg2LocOUT(Reg2LocOUT),
                .ALUSrcOUT(ALUSrcOUT),
                .MemtoRegOUT(MemtoRegOUT), 
                .MemReadOUT(MemReadOUT), 
                .MemWriteOUT(MemWriteOUT),
                .RegWriteOUT(RegWriteOUT),
            
                .BranchOUT(BranchOUT),
                .UncondbranchOUT(UncondbranchOUT),
                
                .ALUOpOUT(ALUOpOUT),
                .ALU_OUT(ALU_OUT),
                .DMOUT(DMOUT),   
                .ZeroFlagOUT(ZeroFlagOUT)
           
                    );

parameter PERIOD = 10;
initial
    clk=1'b1;
always #(PERIOD/2) clk= ~clk;



endmodule
