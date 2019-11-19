`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2019 06:44:30 PM
// Design Name: 
// Module Name: IM_tb
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


module IM_tb();

       reg [63:0] Address;
       wire [31:0] Instruction;
       
Instruction_Memory uut(
                        .Address(Address),
                        .Instruction(Instruction)
                        );
                        
initial
    begin
        Address  = 64'b00;
        #50;
        Address  = 64'b01;
        #50;
        Address  = 64'b10;
        #50;
        Address  = 64'b11;
        #50;
        Address  = 64'b100;
        #50;
        Address  = 64'b101;
        #50;
        Address  = 64'b110;
        #50;
        Address  = 64'b111;
        #50;
        Address  = 64'b1000;
        #50;
        Address  = 64'b1001;
        #50;
        $finish;
    
    end






endmodule
