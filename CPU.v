`timescale 1ns / 1ps

module Risc_16_bit(
 input clk
);
 wire mem_read,mem_write,alu_src,reg_dst,mem_to_reg,reg_write;
 wire brz,brn,brc,bro,bra,jmp,ret;
 wire[1:0] alu_op;
 wire [5:0] opcode;
 // Datapath
 Datapath_Unit DU
 (
  .clk(clk),
  .mem_read(mem_read),
  .mem_write(mem_write),
  .alu_src(alu_src),
  .reg_dst(reg_dst),
  .mem_to_reg(mem_to_reg),
  .reg_write(reg_write),
  .brz(brz),
  .brn(brn),
  .brc(brc),
  .bro(bro),
  .bra(bra),
  .jmp(jmp),
  .ret(ret),
  .alu_op(alu_op),
  .opcode(opcode)
 );
 // control unit
 Control_Unit control
 (
  .opcode(opcode),
  .reg_dst(reg_dst),
  .mem_to_reg(mem_to_reg),
  .alu_op(alu_op),
  .brz(brz),
  .brn(brn),
  .brc(brc),
  .bro(bro),
  .bra(bra),
  .jmp(jmp),
  .ret(ret),
  .mem_read(mem_read),
  .mem_write(mem_write),
  .alu_src(alu_src),
  .reg_write(reg_write)
 );

endmodule
