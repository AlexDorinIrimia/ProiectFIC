`timescale 1ns / 1ps

module alu_control( ALU_Cnt, ALUOp, Opcode);
 output reg[6:0] ALU_Cnt;
 input [1:0] ALUOp;
 input [5:0] Opcode;
 wire [5:0] ALUControlIn;
 assign ALUControlIn = {ALUOp,Opcode};
 always @(ALUControlIn)
 casex (ALUControlIn)
   8'b10xxxxxx: ALU_Cnt=6'b000000;
   8'b01xxxxxx: ALU_Cnt=6'b000001;
   8'b00000010: ALU_Cnt=6'b000000;
   8'b00000011: ALU_Cnt=6'b000001;
   8'b00000100: ALU_Cnt=6'b000010;
   8'b00000101: ALU_Cnt=6'b000011;
   8'b00000110: ALU_Cnt=6'b000100;
   8'b00000111: ALU_Cnt=6'b000101;
   8'b00001000: ALU_Cnt=6'b000110;
   8'b00001001: ALU_Cnt=6'b000111;
   8'b00001010: ALU_Cnt=6'b001000;
   8'b00001011: ALU_Cnt=6'b001001;
   8'b00001100: ALU_Cnt=6'b001010;
   8'b00001101: ALU_Cnt=6'b001011;
   8'b00001110: ALU_Cnt=6'b001100;
   8'b00001111: ALU_Cnt=6'b001101;
   8'b00010000: ALU_Cnt=6'b001111;
   8'b00010001: ALU_Cnt=6'b010000;
   8'b00010010: ALU_Cnt=6'b010001;
   8'b00010011: ALU_Cnt=6'b010010;
  endcase
endmodule
