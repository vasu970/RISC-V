`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2024 22:51:20
// Design Name: 
// Module Name: Imm_Gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Imm_Gen(
input [31:0]Instruction_code,
input [1:0] ImmSel,
output  reg [31:0]Imm_out1=0
    );
    reg [11:0]Imm_out;
  always@(*)
  case(ImmSel)
  2'b00:
  Imm_out[11:0]=Instruction_code[31:20];//I-type instrn
  2'b01:
  Imm_out[11:0]={Instruction_code[31:25],Instruction_code[11:7]};//S-typeinstrn
 2'b10:
 Imm_out[11:0]={Instruction_code[31],Instruction_code[7],Instruction_code[30:25],Instruction_code[11:8]};//SB type instrn store byte
 2'b11:
 Imm_out1[20:1]={Instruction_code[31],Instruction_code[19:12],Instruction_code[20],Instruction_code[30:21]};//J-type instruction
    endcase
always@(Imm_out,ImmSel)
begin
if(ImmSel!=3)
begin
 Imm_out1[31:12]<={20{Imm_out[11]}};
 Imm_out1[11:0]<= {Imm_out[11:0]};
 end
 else
 begin
  Imm_out1[31:21]<={11{Imm_out1[20]}};
 Imm_out1[0]<= 0;
 end
 end
endmodule
//  2'b11:
//    Imm_out1[20:1]<={Instruction_code[31],Instruction_code[19:12],Instruction_code[20],Instruction_code[30:21]};//J-type instruction