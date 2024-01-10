`timescale 1ns / 1ps

module Datapath_Unit(
 input clk,
 input mem_read,mem_write,alu_src,reg_dst,mem_to_reg,reg_write,
 input brz,brn,brc,bro,bra,jmp,ret,
 input[1:0] alu_op,
 output[5:0] opcode
);
 reg  [15:0] pc_current;
 reg [3:0] flags;
 wire [15:0] pc_next,pc2;
 wire [15:0] instr;
 wire [2:0] reg_write_dest;
 wire [15:0] reg_write_data;
 wire [2:0] reg_read_addr_1;
 wire [15:0] reg_read_data_1;
 wire [2:0] reg_read_addr_2;
 wire [15:0] reg_read_data_2;
 wire [15:0] ext_im,read_data2;
 wire [2:0] ALU_Control;
 wire [15:0] ALU_out;
 wire zero_flag;
 wire [15:0] PC_jmp, PC_brz, PC_brn,PC_bro,PC_brc,PC_bra,PC_ret;
 wire [15:0] PC_2brz,PC_2brn,PC_2brc,PC_2bro,PC_2bra;
 wire brz_control,brn_control,brc_control,bro_control,bra_control;
 wire [9:0] jump_shift,ret_shift;
 wire [15:0] mem_read_data;
 // PC 
 initial begin
  pc_current <= 16'd0;
 end
 always @(posedge clk)
 begin 
   pc_current <= pc_next;
 end
 assign pc2 = pc_current + 16'd2;
 // instruction memory
 Instruction_Memory im(.pc(pc_current),.instruction(instr));
 // jump shift left 2
 assign jump_shift = {instr[11:0],1'b0};
 assign ret_shift = {instr[11:0],1'b0};
 // multiplexer regdest
 assign reg_write_dest = (reg_dst==1'b1) ? instr[5:3] :instr[8:6];
 // register file
 assign reg_read_addr_1 = instr[11:9];
 assign reg_read_addr_2 = instr[8:6];

 // GENERAL PURPOSE REGISTERs
 GPRs reg_file
 (
  .clk(clk),
  .reg_write_en(reg_write),
  .reg_write_dest(reg_write_dest),
  .reg_write_data(reg_write_data),
  .reg_read_addr_1(reg_read_addr_1),
  .reg_read_data_1(reg_read_data_1),
  .reg_read_addr_2(reg_read_addr_2),
  .reg_read_data_2(reg_read_data_2)
 );
 // immediate extend
 assign ext_im = {{10{instr[5]}},instr[5:0]};  
 // ALU control unit
 alu_control ALU_Control_unit(.ALUOp(alu_op),.Opcode(instr[15:10]),.ALU_Cnt(ALU_Control));
 // multiplexer alu_src
 assign read_data2 = (alu_src==1'b1) ? ext_im : reg_read_data_2;
 // ALU 
 ALU alu_unit(.a(reg_read_data_1),.b(read_data2),.alu_control(ALU_Control),.result(ALU_out),.zero(zero_flag),.flags(flags));
 // PC beq add
 assign PC_brz = pc2 + {ext_im[14:0],1'b0};
 assign PC_brn = pc2 + {ext_im[14:0],1'b0};
 assign PC_brc = pc2 + {ext_im[14:0],1'b0};
 assign PC_bro = pc2 + {ext_im[14:0],1'b0};
 assign PC_bra = pc2 + {ext_im[14:0],1'b0};
 // beq control
 assign brz_control = brz & flags[0];
 assign brn_control = brn & flags[1];
 assign brc_control = brc & flags[2];
 assign bro_control = brn & flags[3];
 assign bra_control = bra;
 // PC_beq
 assign PC_2brz = (brz_control==1'b1) ? PC_brz : pc2;
 // PC_bne
 assign PC_2brn = (brn_control==1'b1) ? PC_brn : PC_2brz;
 assign PC_2brc = (brc_control==1'b1) ? PC_brc : PC_2brz;
 assign PC_2bro = (bro_control==1'b1) ? PC_bro : PC_2brz;
 assign PC_2bra = PC_bra;
 // PC_j
 assign PC_jmp = {pc2[15:13],jump_shift};
 assign PC_ret = {pc2[15:13],ret_shift};
 // PC_next
 assign pc_next = (jmp == 1'b1) ? PC_jmp :  PC_2brn;

 /// Data memory
  Data_Memory dm
   (
    .clk(clk),
    .mem_access_addr(ALU_out),
    .mem_write_data(reg_read_data_2),
    .mem_write_en(mem_write),
    .mem_read(mem_read),
    .mem_read_data(mem_read_data)
   );
 
 // write back
 assign reg_write_data = (mem_to_reg == 1'b1)?  mem_read_data: ALU_out;
 // output to control unit
 assign opcode = instr[15:10];
endmodule
