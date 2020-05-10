//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module Simple_Single_CPU(
        clk_i,
		nrst_i
		);
		
//I/O port
input			clk_i;
input			nrst_i;  // negative reset

//Internal Signles

// decoder


//Greate componentes
ProgramCounter PC(
        .clk_i(),      
	    .nrst_i (),     
	    .pc_in_i() ,   
	    .pc_out_o() 
	    );

// adder for program counter
Adder Adder1(
        .src1_i(),     
	    .src2_i(),     
	    .sum_o()    
	    );
	
Instr_Memory IM(
        .pc_addr_i(),  
	    .instr_o()    
	    );
		
Reg_File Registers(
        .clk_i(),      
	    .nrst_i() ,     
        .RSaddr_i() ,  
        .RTaddr_i() ,  
        .RDaddr_i() ,  
        .RDdata_i()  , 
        .RegWrite_i (),
        .RSdata_o() ,  
        .RTdata_o()   
        );
	
Decoder Decoder(
        .instr_op_i(), 
	    .RegWrite_o(), 
	    .ALU_op_o(),   
	    .ALUSrc_o(),      
		.Branch_o(),
		.MemRead_o(),
		.MemWrite_o(),
		.MemtoReg_o()
	    );

ALU_Ctrl AC(
        .funct3_i(),
		.funct7_i(),		
        .ALUOp_i(),   
        .ALUCtrl_o() 
        );
	
Imm_Gen IG(
    .instr_i(),
    .signed_extend_o()
    );

MUX_2to1 #(.size(64)) Mux_ALUSrc(
        .data0_i(),
        .data1_i(),
        .select_i(),
        .data_o()
        );	
		
ALU ALU(
        .src1_i(),
	    .src2_i(),
	    .ctrl_i(),
	    .result_o(),
		.zero_o()
	    );
	
Data_Memory Data_Memory(
	.clk_i(),
	.addr_i(),
	.data_i(),
	.MemRead_i(),
	.MemWrite_i(),
	.data_o()
	);
	
Adder Adder2(
        .src1_i(),     
	    .src2_i(),     
	    .sum_o()      
	    );
		
Shift_Left_One_64 Shifter(
        .data_i(),
        .data_o()
        ); 		


		
MUX_2to1 #(.size(32)) Mux_PC_Source(
        .data0_i(),
        .data1_i(),
        .select_i(),
        .data_o()
        );	

MUX_2to1 #(.size(64)) Mux_Write_Back(
        .data0_i(),
        .data1_i(),
        .select_i(),
        .data_o()
        );	

endmodule
		  


