`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2019 06:04:24 PM
// Design Name: 
// Module Name: Signext_tb
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


module Signext_tb();
    reg [31:0] in;
    wire [63:0] extendAddr;
    
Sign_extend uut(
                .in(in),
                .out(extendAddr)
                );   
initial
    begin
        in = 32'b0;
        #50;
        in = 32'b00010100000000001110000000000001;
        #50;
        in = 32'b10001010000000011111000000000010;
        #50;
        in = 32'b10001011000000011111110000000011;
        #50;
        in = 32'b10101010000000011111100000000100;
        #50;
        in = 32'b10110100000000000111100000000011;
        #50;
        in = 32'b11001011001111110000000000000010;
        #50;
        in = 32'b11110010110000011111110000000011;
        #50;
        in = 32'b11111000000000111110000000000100;
        #50;
        in = 32'b11111000010000011100000000001001;
        #100;
        $finish;
    
    
    end
    
endmodule
