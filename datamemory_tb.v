`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2019 01:37:41 PM
// Design Name: 
// Module Name: datamemory_tb
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


module datamemory_tb();
    parameter BITSIZE = 32;
	parameter REGSIZE = 64;
    reg clk;
    reg MemWrite;
    reg MemRead;
    reg [REGSIZE-1:0]Addr;
    reg [REGSIZE-1:0]WriteData; 
    wire [REGSIZE-1:0] DMout;
    
    
Data_memory uut1(  
    .clk(clk),
    .Addr(Addr), 
    .WriteData(WriteData), 
    .MemWrite(MemWrite),
    .MemRead(MemRead), 
    .DMout(DMout)
    );
    
    parameter PERIOD = 10;
    initial
        clk=1'b0;
    always #(PERIOD/2) clk= ~clk;
    
    initial
        begin
            MemWrite = 1'b0;
            MemRead = 1'b1;
            Addr = 64'b1111;
            WriteData = 64'b11;
            #50;
            MemWrite = 1'b1;
            Addr = 64'b11110;
            WriteData = 64'b10;
            #50;
            Addr = 64'b1011;
            WriteData = 64'b110;
            #50;
            Addr = 64'b1101;
            WriteData = 64'b111;
            #50;
            $finish;
            
            
        
        
        end
    
    
    
endmodule
