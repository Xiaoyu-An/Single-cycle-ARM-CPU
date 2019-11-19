`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2019 10:37:40 AM
// Design Name: 
// Module Name: Register_tb
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


module Register_tb();
    parameter BITSIZE = 64;
	parameter REGSIZE = 32;
	
	reg [$clog2(REGSIZE)-1:0] ReadSelect1, ReadSelect2, WriteSelect;
    reg [BITSIZE-1:0] WriteData;
    reg WriteEnable;
    wire [BITSIZE-1:0] ReadData1, ReadData2;
    reg clk, rst;
    

    Register_File uut(
        .ReadSelect1(ReadSelect1), 
        .ReadSelect2(ReadSelect2), 
        .WriteSelect(WriteSelect), 
        .WriteData(WriteData), 
        .WriteEnable(WriteEnable), 
        .ReadData1(ReadData1), 
        .ReadData2(ReadData2), 
        .clk(clk), 
        .rst(rst)
                        );
                        
    parameter PERIOD = 10;
    initial
        clk=1'b0;
    always #(PERIOD/2) clk= ~clk;
    
    
    initial
        begin
            ReadSelect1 = 5'b01;
            ReadSelect2 = 5'b10;
            WriteSelect = 5'b0;
            WriteData = 64'b00;
            WriteEnable = 1'b0;
            rst = 1'b0;
            #50;
            ReadSelect1 = 5'b10;
            #50;
            ReadSelect2 = 5'b11;
            #50;
            WriteEnable = 1'b1;
            WriteData = 64'b1111;
            WriteSelect = 5'b100;
            #50;
            rst = 1'b1;
            #50;
            rst = 1'b0;
            #50;
            $finish;
            
            
        end
   


endmodule
