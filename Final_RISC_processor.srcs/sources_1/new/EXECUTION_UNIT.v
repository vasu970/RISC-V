`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2024 22:19:37
// Design Name: 
// Module Name: EXECUTION_UNIT
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


module EXECUTION_UNIT(
input [31:0]Read_Data_1_1,Read_Data_2_1,ALU_result_1,data_to_reg_in_jmp_1,Write_Data_to_reg,Imm_out1,
input[1:0]forward1,forward2,
input[6:0]opcode_1,Function7_1,
input[2:0]Function3_1,
input ALUSrc_1,Jump_1,
input  [1:0]ALUOp_1,
output [31:0] Res,
output Zero,
output  [31:0] out_1,out_2


    );
    wire[31:0]ALU_result;
//    wire [31:0] out_1,out_2,B;
    
        wire [31:0] B;
    
    MUX_2bit ALU_input_1(Read_Data_1_1 ,ALU_result_1,Write_Data_to_reg,forward1, out_1);

MUX_2bit ALU_input_2(Read_Data_2_1 ,ALU_result_1,Write_Data_to_reg,forward2, out_2);

    MUX IMM_OR_REG_TO_ALU(Imm_out1,out_2, ALUSrc_1,B);
    
    ALU s5( out_1,B,ALUOp_1,opcode_1, Function7_1,Function3_1, Zero,ALU_result);
    
    MUX JUMP_Based(data_to_reg_in_jmp_1,ALU_result, Jump_1,Res);
    
    
    
    
    
endmodule
