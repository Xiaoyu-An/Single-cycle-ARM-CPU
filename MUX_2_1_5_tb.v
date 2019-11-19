`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2019 06:48:11 PM
// Design Name: 
// Module Name: MUX_2_1_5_tb
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


module MUX_2_1_5_tb();
    
    reg [31:0] Instruction;
    reg Reg2Loc;	
    
    wire [4:0] ReadSelect1,ReadSelect2,WriteSelect;
    
MUX_2_1_5 uut(
    .Instruction(Instruction),
    .Reg2Loc(Reg2Loc),
    .ReadSelect1(ReadSelect1),
    .ReadSelect2(ReadSelect2),
    .WriteSelect(WriteSelect)
    
    );
    
initial 
    begin
        Instruction = 32'b10001011000_00101_000000_00100_00110;
        Reg2Loc = 0;
        #50;
        Instruction = 32'b11110010100_0000000000000110_11110;
        #50;
        Instruction = 32'b11110010100_0000000000000100_00010;
        Reg2Loc = 1;
        #50;
        Instruction = 32'b11110010100_0000000000000100_00011;
        Reg2Loc = 0;
        #50;
        $finish;
        
    end


endmodule
