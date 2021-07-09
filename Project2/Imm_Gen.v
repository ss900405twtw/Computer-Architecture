
module Imm_Gen(
    instr_i,
    signed_extend_o
    );
               
//I/O ports
input   [32-1:0] instr_i;
output  [64-1:0] signed_extend_o;

//Internal Signals
reg     [64-1:0] signed_extend_o;

//Sign extended
always@(*) begin
     case(instr_i[6:0])  //R-type instructions have no immediates
       7'b0010011:begin //addi, slti
         signed_extend_o<= { {52{instr_i[31]}}, {instr_i[31:20]}};    //<= is a nonblocking assignment.
       end

       7'b0100011:begin//sd
       signed_extend_o<= { {52{instr_i[31]}}, {instr_i[31:25]}, {instr_i[11:7]}};
       end  
       7'b0000011:begin//ld   //ld failed, strange
       signed_extend_o<= { {52{instr_i[31]}}, {instr_i[31:20]}};
       end  
       7'b1100011:begin //beq
       signed_extend_o<= { {53{instr_i[31]}}, {instr_i[7]}, {instr_i[30:25]}, {instr_i[11:8]}};
       end
  
     endcase
end 


//see slides {} means concatenation

endmodule      
     