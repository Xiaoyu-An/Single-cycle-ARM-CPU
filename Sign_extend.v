`timescale 1ns / 1ps

module Sign_extend(in,out);
		
	input [31:0] in;
	output reg [63:0] out;
	
	
initial
    begin
        out = 64'b0;
    end
	
always @ (in)
	begin
	   if (in[31:21] == 11'b00010100000 && in[20] == 0)
	       out <= {43'b0,in[20:0]};
	       
	   else if (in[31:21] == 11'b00010100000 && in[20] == 1)
	       out <= {43'h7ffffffffff,in[20:0]};
	       
	   else if (in[31:21] == 11'b10110100000 && in[20] == 0)   ///CBNZ
	       out <= {48'b0,in[20:5]};
	       
	   else if (in[31:21] == 11'b10110100000 && in[20] == 1)
	       out <= {48'hffffffffffff,in[20:5]};
	       
	   else if (in[31:21] == 11'b11110010100 && in[20] == 0)    ///MOVK
	       out <= {48'b0,in[20:5]};
	       
	   else if (in[31:21] == 11'b11110010100 && in[20] == 1)    ///MOVK
	       out <= {48'hffffffffffff,in[20:5]};
	       
	   else if (in[31:21] == 11'b11111000000 && in[20] == 0)
	       out <= {53'b0,in[20:10]};
	   
	   else if (in[31:21] == 11'b11111000000 && in[20] == 1)
	       out <= {53'h1fffffffffffff,in[20:10]};
	   
	   else if (in[31:21] == 11'b11111000010 && in[20] == 0)
	       out <= {53'b0,in[20:10]};
	       
	  else if (in[31:21] == 11'b11111000010 && in[20] == 1)
	       out <= {53'h1fffffffffffff,in[20:10]};     
	       
	   else
	       out <= 64'b01;
	       
	
		
	end
	
	
	
endmodule