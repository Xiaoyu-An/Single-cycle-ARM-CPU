`timescale 1ns / 1ps

module Data_memory(clk,rst, Addr, WriteData, MemWrite, MemRead, DMout);
	
	parameter REGSIZE = 64;
	
	input clk, rst,MemWrite,MemRead;
	input [REGSIZE-1:0] Addr;
	input [REGSIZE-1:0] WriteData;
	output [REGSIZE-1:0] DMout;
	
    reg [REGSIZE-1:0] DMout;
	
	reg [REGSIZE-1:0] data_mem [REGSIZE-1:0];
	

	integer i;
	
	//initially fill memory
	initial begin
		
 		for(i=0; i<64; i=i+1)
 		 begin
			data_mem[i] <= i;
		end
	end
	
	//data is written sequentially
	always @(posedge clk)
	begin
	    if (rst)
	       for (i=0;i<64;i = i+1)
	           data_mem[Addr] <= 'b0;
	    else
	       begin
		      if(MemWrite) begin
			     data_mem[Addr] <= WriteData;
		      end
		   end
	end
	
	//data can be read at any time 
	always @(Addr,data_mem[Addr],MemRead)
	begin
		DMout = data_mem[Addr];
	end
	
	
endmodule