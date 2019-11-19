`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2019 02:48:47 PM
// Design Name: 
// Module Name: pc_test
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


module pc_test();

    reg clk;
    reg rst;
    reg [63:0] InitValue;
    reg Branch;
    reg UncondBranch;
    reg ZeroFlag;
    reg [63:0] Addr;
    wire [63:0] PC;

ProgCounter uut(
    .clk(clk),
    .rst(rst),
    .InitValue(InitValue),
    .Branch(Branch),
    .UncondBranch(UncondBranch),
    .ZeroFlag(ZeroFlag),
    .Addr(Addr),
    .PC(PC) );
    
                            
    parameter PERIOD = 10;
    initial
        clk=1'b0;
    always #(PERIOD/2) clk= ~clk;
    
    initial
        begin
            rst = 1;
            InitValue = 64'b00;
            Branch = 1'b0;
            ZeroFlag = 1'b0;
            UncondBranch = 1'b0;
            Addr = 64'b1;
            #50;
            rst = 0;
            Branch = 1'b1;
            ZeroFlag = 1'b1;
            UncondBranch = 1'b0;
            Addr = 64'b10;
            #50;
            rst = 0;
            Branch = 1'b0;
            ZeroFlag = 1'b0;
            UncondBranch = 1'b1;
            Addr = 64'b10;
            
            #50;
            Branch = 1'b1;
            ZeroFlag = 1'b1;
            UncondBranch = 1'b1;
            Addr = 64'b11;
            #50;
            $finish;
        
        
        
        end
    
endmodule
