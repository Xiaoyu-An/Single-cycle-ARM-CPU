`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2019 02:18:18 PM
// Design Name: 
// Module Name: ALU_64
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

module ALU_64(A,B,ALU_Opcode,ALU_Out,Z);
    
           
    parameter BITSIZE = 32;
	parameter REGSIZE = 64;
	
	input  [REGSIZE-1:0]  A,B;  // ALU 64-bit Inputs                 
    input  [2:0]  ALU_Opcode;// ALU Selection
    output reg [REGSIZE-1:0] ALU_Out; // ALU 64-bit Output
    output Z;
    
    
    /*wire ReadData2;
    Register_File uut4( .ReadData1(A),
                        .ReadData2(ReadData2));
    
    
    MUX_2_1 uut5(.in0(ReadData2), 
                 .in1(SignExtendOut),  ///from sign extend
                 .s0(ALUSrc), /////from control signal
                 .out(B)
                  );
    */
    
    always @(*)
    begin
        case(ALU_Opcode)
            3'b000:
                begin
                    ALU_Out <= A & B;
                end
            3'b001: //  Logical or
                begin
                    ALU_Out <= A | B;
                end
                
            3'b010:
                begin
                    ALU_Out <= ~ A;
                end
                
            3'b011: //move A 
                begin
                    ALU_Out <= A ;
                end
                
            3'b100: // move B
                begin
                    ALU_Out <= B;
                end
            3'b101:   //add
                begin
                    ALU_Out <= A + B;
                end
            3'b110:   //subtract
                begin
                    ALU_Out <= A - B;
           
               end
            3'b111: // MOVK
               begin
                    ALU_Out <= {A[63:16],B[15:0]}; //a b exchange
                    
               end
               
        endcase
    end      
    assign Z = (ALU_Out == 0) ? 0:1;
    
endmodule