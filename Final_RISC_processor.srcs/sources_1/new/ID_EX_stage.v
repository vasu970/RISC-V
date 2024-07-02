`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2024 16:14:44
// Design Name: 
// Module Name: ID_EX_stage
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


module ID_EX_stage(
input clk,ALUSrc,Regwrite,Branch,Jump,z,Mem_Reg,Mem_Read,
input [4:0] Rscr2,Rscr1,
input [1:0]ALUOp,
input [4:0] Rdst,
input [6:0]opcode,Function7,
input [2:0] Function3,
input [31:0]Read_Data_1,Read_Data_2,Imm_out1,data_to_reg_in_jmp,
input [32:0]Lef_1,
input Mem_write,
output reg Mem_write_1,
output reg ALUSrc_1,Regwrite_1,Branch_1,Jump_1,z_1,Mem_Reg_1,Mem_Read_1,
output reg [1:0]ALUOp_1,
output reg [4:0] Rdst_1,
output reg [6:0]opcode_1,Function7_1,
output reg [2:0] Function3_1,
output reg [31:0]Read_Data_1_1,Read_Data_2_1,Imm_out1_1,data_to_reg_in_jmp_1,
output reg [32:0]Lef_1_1,
output reg [4:0] Rscr2_1,Rscr1_1
    );
    
    
    
    
//    D_flipflop #(32) d1(clk,Read_Data_1,Read_Data_1_1);//second stage of pipeline
//    D_flipflop #(32) d2(clk,Read_Data_2,Read_Data_2_1);//second stage of pipeline
//    D_flipflop #(5) d3(clk,Rdst,Rdst_1);//second stage of pipeline
//    D_flipflop #(1) d7(clk,ALUSrc,ALUSrc_1);//second stage of pipeline
//    D_flipflop #(2) d8(clk,ALUOp,ALUOp_1);//second stage of pipeline
//    D_flipflop #(1) d9(clk,Regwrite,Regwrite_1);//second stage of pipeline
    always@(posedge clk)
    begin
    Read_Data_1_1<=Read_Data_1;
    Read_Data_2_1<=Read_Data_2;
    Imm_out1_1<=Imm_out1;
    Lef_1_1<=Lef_1;
    Rdst_1<=Rdst;
    ALUSrc_1<=ALUSrc;
    Regwrite_1<=Regwrite;
    Branch_1<=Branch;
    ALUOp_1<=ALUOp;
    Function3_1<=Function3;
    opcode_1<=opcode;
    Function7_1<=Function7;
    Rscr2_1<=Rscr2;
    Rscr1_1<=Rscr1;
    Mem_write_1<=Mem_write;
    Mem_Reg_1<=Mem_Reg;
    Jump_1<=Jump;
    data_to_reg_in_jmp_1<=data_to_reg_in_jmp;
    Mem_Read_1<=Mem_Read;
    z_1<=z;

    end
    
    
    
    
endmodule
