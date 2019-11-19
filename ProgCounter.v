`timescale 1ns / 1ps


module ProgCounter(Branch,Uncondbranch,ZeroFlag,Addr, PC,NewPC);
    input [63:0] PC;
    input Branch;
    input Uncondbranch;
    input ZeroFlag;
    input [63:0] Addr;
    output reg [63:0] NewPC;
    
    /*
    wire w1, result;
    and G1 (w1, ZeroFlag, Branch);
    or G2 (result, Uncondbranch, w1);
      */ 
    
    
    always @(*)
        begin
            if (ZeroFlag & Branch | Uncondbranch)
                NewPC <= PC + Addr;
            else
                NewPC <= PC + 1;
        
        end
        
            
endmodule
