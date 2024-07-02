`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2024 12:13:03
// Design Name: 
// Module Name: Top_module
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
module Top_module(
input clk,reset
    );
wire [1:0]forward1,forward2;
wire[31:0] PC;
wire Mem_write,Mem_write_1,Mem_write_2,Jump,Jump_1,clk_stall,stall;
wire  [31:0]Instruction_code,Instruction_code_1;
wire[6:0]  Function7,Function7_1;
wire[6:0] opcode,opcode_1;
wire[4:0]  Rdst,Rdst_1,Rdst_2,Rdst_3,Rscr2_r,Rscr1_r;
wire[4:0] Rscr1,Rscr2,Rscr2_1,Rscr1_1,Rdst_r;
wire[2:0] Function3,Function3_1;
wire [1:0] ImmSel,ALUOp,ALUOp_1;
wire Zero,Branch,Flush,PCSrc,z_1,Mem_Read,Mem_Read_1,Mem_Read_2,z,Mem_Reg,Mem_Reg_1,Mem_Reg_2,Mem_Reg_3,Regwrite,Regwrite_1,Regwrite_2,Regwrite_3,ALUSrc,ALUSrc_1;
wire  [31:0] Read_Data_1,Read_Data_1_1,Read_Data_2_1,Read_Data_2,ALU_result,ALU_result_1,ALU_result_2,B,
Read_data_mem,Write_Data_to_reg,sign_extended,out_1,out_2;
wire[31:0]Imm_out1,Imm_out1_1,Read_Data_2_2;
wire  [31:0] PC_plus_x,PC_1;
wire [31:0] Immediate,data_to_reg_in_jmp,data_to_reg_in_jmp_1,data_to_reg_in_jmp_2,data_to_reg_in_jmp_3;
wire[32:0] Lef_1,Lef_1_1;

assign {Function7,Rscr2,Rscr1,Function3,Rdst,opcode}=Instruction_code_1;//r -type instruction


INSTRUCTION_Fetch Fetch_block( clk_stall,reset,Branch,Jump,z,Flush,Lef_1,Instruction_code,PC  );//Fetch unit 1st stage

 IF_ID_stage STAGE1(clk_stall, Instruction_code,Instruction_code_1);


INSTRUCTION_decode Control_gen_block(clk,stall,reset,Write_Data_to_reg,Instruction_code_1,PC,
Regwrite_3,Rdst_3,Rdst,Rscr1,Rscr2, opcode,Function7,Function3,
Regwrite, ALUSrc, Branch, Mem_write, Mem_Reg, Mem_Read, Jump,z,ALUOp, Read_Data_1,
Read_Data_2,Imm_out1,data_to_reg_in_jmp,Lef_1,Rdst_r,Rscr1_r,Rscr2_r);//2nd stage


 ID_EX_stage STAGE2(clk,ALUSrc,Regwrite,Branch,Jump,z,Mem_Reg,Mem_Read,
 Rscr2_r,Rscr1_r,ALUOp,Rdst_r,opcode,Function7,
 Function3,Read_Data_1,Read_Data_2,Imm_out1,data_to_reg_in_jmp,Lef_1,Mem_write,
 Mem_write_1,ALUSrc_1,Regwrite_1,Branch_1,Jump_1,z_1,
 Mem_Reg_1,Mem_Read_1,ALUOp_1,Rdst_1,opcode_1,Function7_1,Function3_1,Read_Data_1_1,Read_Data_2_1,
 Imm_out1_1,data_to_reg_in_jmp_1,Lef_1_1,Rscr2_1,Rscr1_1);
 
EXECUTION_UNIT ALU_unit(Read_Data_1_1,Read_Data_2_1,ALU_result_1,data_to_reg_in_jmp_1,
Write_Data_to_reg,Imm_out1_1,forward1,forward2,opcode_1,Function7_1,
Function3_1,ALUSrc_1,Jump_1, ALUOp_1,ALU_result, Zero,out_1,out_2);//3 rd stage
 
 
 EX_mem_stage STAGE3(clk,Regwrite_1,Mem_Read_1, Rdst_1,ALU_result,out_2,
 data_to_reg_in_jmp_1,Mem_write_1,Mem_Reg_1,Mem_Reg_2,Mem_write_2, 
 Regwrite_2,Mem_Read_2,Rdst_2, ALU_result_1,Read_Data_2_2,data_to_reg_in_jmp_2);
 
 
 data_memory s9(clk,reset,Mem_write_2,Mem_Read_2,ALU_result_1,Read_Data_2_2, Read_data_mem );//4th stage
 
 
 mem_wb_stage STAGE4(clk,Regwrite_2,Mem_Reg_2,Rdst_2,ALU_result_1,
 data_to_reg_in_jmp_2, Regwrite_3,Mem_Reg_3,Rdst_3, ALU_result_2,data_to_reg_in_jmp_3);
 
 
 
 MUX DATA_FROM_MEM_OR_ALU_RESULT_TO_REG_MEM(Read_data_mem,
ALU_result_2, Mem_Reg_3,Write_Data_to_reg);//5th stage
 
FORWARD_UNIT forward_unit(Rscr1_1,Rscr2_1,Rdst_2,Rdst_3, Mem_Read_1,Mem_write_1,Regwrite_2,Regwrite_3, forward1, forward2);

Branch_predictor_static_not_take for_flushing(Branch,z,Flush);


 STALL_UNIT FOR_STALLING(clk,Mem_Read_1,Rdst_1,Rscr1_r,Rscr2_r,clk_stall,stall );


endmodule
