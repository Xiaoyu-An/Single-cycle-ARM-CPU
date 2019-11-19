`timescale 1ns / 1ns

module Instruction_Memory(Address, Instruction);

	parameter BITSIZE = 32;
	parameter REGSIZE = 64;
	input [REGSIZE-1:0] Address;
	output reg [BITSIZE-1:0] Instruction;

	reg [BITSIZE-1:0] memory_file [REGSIZE-1:0];	// Entire list of memory

	// Asyncronous read of memory. Was not specified.
	always @(Address, memory_file[Address])
		begin
			Instruction = memory_file[Address];
		end

	integer i;
	//MY method of filling the memory instead of through a test bench
	initial
		begin
        i = 0;
        memory_file[i] = 32'b11111000000_00000000000_00000_11111; // stur xzr,[x0, 0]
        i = i + 1;
        memory_file[i] = 32'b11111000000_00000000001_00000_00001; // stur x1,[x0, 1]
        i = i + 1;
        memory_file[i] = 32'b11110010100_0000000000000110_11110; // movk x30, 6
        i = i+1;
        // start:
        memory_file[i] = 32'b11001011000_11110_000000_00010_00011; // sub x3. x2. x30(6)
        i = i+1;
        memory_file[i] = 32'b10110100000_0000000000000010_00011; //cbnz x3, loop
        i = i+1;
        // end:
        memory_file[i] = 32'b00010100000_000000000000000000000; // b 0
        i = i+1;
        // loop:
        memory_file[i] = 32'b11111000010_11111111111_00010_00100; // ldur x4, [x2, -1]
        i = i+1;
        memory_file[i] = 32'b11111000010_11111111110_00010_00101; // ldur x5, [x2, -2]
        i = i+1;
        memory_file[i] = 32'b10001011000_00101_000000_00100_00110; // add x6, x4, x5
        i = i+1;
        memory_file[i] = 32'b11111000000_00000000000_00010_00110; // stur x6, [x2, 0]
        i = i+1;
        memory_file[i] = 32'b10001011000_00001_000000_00010_00010; // add x2, x2, x1
        i = i + 1;
        memory_file[i] = 32'b00010100000_111111111111111111000; // b start    
       

		
		
		
		
		
		/*begin
			i = 0;
			memory_file[i] = 32'b00010100000_000000000000000000010;  //BRANCH    b 2
			i = i+1;
			i = i+1;
			memory_file[i] = 32'b10001010000_00001_000000_00010_00000;  //AND   and x0,x1,x2
			i = i+1;
			memory_file[i] = 32'b10001011000_00001_000000_00010_00000; //ADD    add x0,x1,x2
			i = i+1;
			memory_file[i] = 32'b10101010000_00001_000000_00010_00000;  //OR    orr x0,x1,x2
			i = i+1;
			memory_file[i] = 32'b10110100000_0000000000000010_00000;  //CBNZ     cbnz x0,2
			i = i+1;
			i = i+1;
			memory_file[i] = 32'b11001011000_00001_000000_00010_00000;  //SUB   sub x0,x1,x2
			i = i+1;
			memory_file[i] = 32'b11110010100_1111111111111111_00000; //MOVK      movk x0,
			i = i+1;
			memory_file[i] = 32'b11111000000_00000000000_00001_00000;  //STUR    stur x0,[x1,0]
			i = i+1;
			memory_file[i] = 32'b11111000010_00000000000_00001_00000;  //LDUR    ldur x0,[x1,0]
			
			
			*/
			
			
			
			
			
			
			/*
			memory_file[i] = 32'b11110010100_0000000000000001_00000; //MOVK      movk x0,1
			i = i+1; 
			memory_file[i] = 32'b11110010100_0000000000000001_00001; //MOVK      movk x1,1
			i = i+1;
			memory_file[i] = 32'b10001011000_00001_000000_00000_00010; //ADD    add x2,x0,x1
			i = i+1;
			memory_file[i] = 32'b11100000000_00001_000000_00000_00011;  //AND   and x3,x0,x1
			i = i+1;
			memory_file[i] = 32'b11100001100_00001_000000_00000_00100;  //OR    orr x4,x0,x1
			
			i = i+1;
			memory_file[i] = 32'b11001011000_00001_000000_00000_00101;  //SUB   sub x5,x0,x1
			
			i = i+1;
			memory_file[i] = 32'b11111000010_00000000000_00100_00110;  //LDUR    ldur x6,[x4,0]
			i = i+1;
			memory_file[i] = 32'b11111000000_00000000000_00100_00110;  //STUR    stur x6,[x4,0]
			i = i+1;
			memory_file[i] = 32'b00010100000_000000000000000000010;  //BRANCH    b 2
			i = i+1;
			memory_file[i] = 32'b11100000000_00001_000000_00000_00111;  //AND   and x7,x0,x1
			i = i+1;
			memory_file[i] = 32'b11100001100_00001_000000_00000_01000;  //OR    orr x8,x0,x1
			i = i+1;
			memory_file[i] = 32'b10110100000_0000000000000100_00101;  //CBNZ     cbnz x5,2
			i = i+1;
			memory_file[i] = 32'b11110010100_0000000000000011_00000; //MOVK      movk x0,3
			i = i+1; 
			memory_file[i] = 32'b11110010100_0000000000000101_00001; //MOVK      movk x1,5
			i = i+1;
			memory_file[i] = 32'b10001011000_00001_000000_00000_00010; //ADD    add x2,x0,x1
			
			*/
			
		end

endmodule