//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU_Ctrl(
          funct3_i,
		  funct7_i,
          ALUOp_i,
          ALUCtrl_o
          );
          
//I/O ports 
input      [3-1:0] funct3_i;
input      [7-1:0] funct7_i;
input      [2-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;    
     
//Internal Signals
reg        [4-1:0] ALUCtrl_o;

//Parameter

//Select exact operation

endmodule     





                    
                    