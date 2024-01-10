`timescale 1ns / 1ps

module Control_Unit(
      input[5:0] opcode,
      output reg[1:0] alu_op,
      output reg mem_read,mem_write,alu_src,reg_dst,mem_to_reg,reg_write,
      output reg brz,brn,brc,bro,bra,jmp,ret    
    );


always @(*)
begin
 case(opcode) 
 6'b000000:  // LW
   begin
    reg_dst = 1'b0;
    alu_src = 1'b1;
    mem_to_reg = 1'b1;
    reg_write = 1'b1;
    mem_read = 1'b1;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b10;
    jmp = 1'b0;
    ret = 1'b0;   
   end
 6'b000001:  // SW
   begin
    reg_dst = 1'b0;
    alu_src = 1'b1;
    mem_to_reg = 1'b1;
    reg_write = 1'b1;
    mem_read = 1'b1;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b10;
    jmp = 1'b0;
    ret = 1'b0;    
   end
 6'b000010:  // data_processing
   begin
    reg_dst = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b1;
    mem_read = 1'b0;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b00;
    jmp = 1'b0;
    ret = 1'b0;   
   end
 6'b000011:  // data_processing
   begin
    reg_dst = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b1;
    mem_read = 1'b0;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b00;
    jmp = 1'b0;
    ret = 1'b0;    
   end
 4'b000100:  // data_processing
   begin
    reg_dst = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b1;
    mem_read = 1'b0;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b10;
    jmp = 1'b0;
    ret = 1'b0;  
   end
 6'b000101:  // data_processing
   begin
    reg_dst = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b1;
    mem_read = 1'b0;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b10;
    jmp = 1'b0;
    ret = 1'b0;  
   end
 6'b000110:  // data_processing
   begin
    reg_dst = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b1;
    mem_read = 1'b0;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b10;
    jmp = 1'b0;
    ret = 1'b0;   
   end
 6'b000111:  // data_processing
   begin
    reg_dst = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b1;
    mem_read = 1'b0;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b10;
    jmp = 1'b0;
    ret = 1'b0;   
   end
 6'b001000:  // data_processing
   begin
    reg_dst = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b1;
    mem_read = 1'b0;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b10;
    jmp = 1'b0;
    ret = 1'b0;   
   end
 
6'b001001:  // data_processing
   begin
    reg_dst = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b1;
    mem_read = 1'b0;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b10;
    jmp = 1'b0;
    ret = 1'b0;    
   end
6'b001010:  // data_processing
   begin
    reg_dst = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b1;
    mem_read = 1'b0;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b10;
    jmp = 1'b0;
    ret = 1'b0;    
   end
6'b001011:  // data_processing
   begin
    reg_dst = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b1;
    mem_read = 1'b0;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b10;
    jmp = 1'b0;
    ret = 1'b0;    
   end
6'b001100:  // data_processing
   begin
    reg_dst = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b1;
    mem_read = 1'b0;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b00;
    jmp = 1'b0;
    ret = 1'b0;   
   end
6'b001101:  // data_processing
   begin
    reg_dst = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b1;
    mem_read = 1'b0;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b00;
    jmp = 1'b0;
    ret = 1'b0;   
   end
6'b001110:  // data_processing
   begin
   reg_dst = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b1;
    mem_read = 1'b0;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b00;
    jmp = 1'b0;
    ret = 1'b0;   
   end
6'b001111:  // data_processing
   begin
    reg_dst = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b1;
    mem_read = 1'b0;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b00;
    jmp = 1'b0;
    ret = 1'b0;   
   end
6'b010000:  // data_processing
   begin
    reg_dst = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b1;
    mem_read = 1'b0;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b00;
    jmp = 1'b0;
    ret = 1'b0;   
   end
6'b010001:  // data_processing
   begin
    reg_dst = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b1;
    mem_read = 1'b0;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b00;
    jmp = 1'b0;
    ret = 1'b0;   
   end
6'b010010:  // data_processing
   begin
    reg_dst = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b1;
    mem_read = 1'b0;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b00;
    jmp = 1'b0;
    ret = 1'b0;   
   end
6'b010011:  // data_processing
   begin
    reg_dst = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b1;
    mem_read = 1'b0;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b00;
    jmp = 1'b0;
    ret = 1'b0;   
   end
 6'b010100:  
   begin
    reg_dst = 1'b0;
    alu_src = 1'b1;
    mem_to_reg = 1'b1;
    reg_write = 1'b1;
    mem_read = 1'b1;
    mem_write = 1'b0;
    brz = 1'b1;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b01;
    jmp = 1'b0;
    ret = 1'b0;  
   end
 6'b010001:  
   begin
    reg_dst = 1'b0;
    alu_src = 1'b1;
    mem_to_reg = 1'b1;
    reg_write = 1'b1;
    mem_read = 1'b1;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b1;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b01;
    jmp = 1'b0;
    ret = 1'b0;    
   end
 6'b010010: 
   begin
    reg_dst = 1'b0;
    alu_src = 1'b1;
    mem_to_reg = 1'b1;
    reg_write = 1'b1;
    mem_read = 1'b1;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b1;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b01;
    jmp = 1'b0;
    ret = 1'b0;  
   end
6'b010011: 
   begin
    reg_dst = 1'b0;
    alu_src = 1'b1;
    mem_to_reg = 1'b1;
    reg_write = 1'b1;
    mem_read = 1'b1;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b1;
    bra = 1'b0;
    alu_op = 2'b01;
    jmp = 1'b0;
    ret = 1'b0;  
   end   
6'b010100: 
   begin
    reg_dst = 1'b0;
    alu_src = 1'b1;
    mem_to_reg = 1'b1;
    reg_write = 1'b1;
    mem_read = 1'b1;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b1;
    alu_op = 2'b01;
    jmp = 1'b0;
    ret = 1'b0;  
   end   
6'b010101: 
   begin
    reg_dst = 1'b0;
    alu_src = 1'b1;
    mem_to_reg = 1'b1;
    reg_write = 1'b1;
    mem_read = 1'b1;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b00;
    jmp = 1'b1;
    ret = 1'b0;  
   end   
6'b010111: 
   begin
    reg_dst = 1'b0;
    alu_src = 1'b1;
    mem_to_reg = 1'b1;
    reg_write = 1'b1;
    mem_read = 1'b1;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b00;
    jmp = 1'b0;
    ret = 1'b1;  
   end      
 default: begin
    reg_dst = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b0;
    mem_read = 1'b0;
    mem_write = 1'b0;
    brz = 1'b0;
    brn = 1'b0;
    brc = 1'b0;
    bro = 1'b0;
    bra = 1'b0;
    alu_op = 2'b00;
    jmp = 1'b0;
    ret = 1'b0;  
   end
 endcase
 end

endmodule
