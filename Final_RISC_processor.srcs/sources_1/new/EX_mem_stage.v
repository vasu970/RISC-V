`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2024 16:16:02
// Design Name: 
// Module Name: EX_mem_stage
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


module EX_mem_stage(
input clk,Regwrite_1,Mem_Read_1,
input [4:0] Rdst_1,
input[31:0] ALU_result,Read_Data_2_1,data_to_reg_in_jmp_1,
input Mem_write_1,Mem_Reg_1,
output reg Mem_Reg_2,Mem_write_2,
output reg Regwrite_2,Mem_Read_2,
output reg [4:0] Rdst_2,
output reg [31:0] ALU_result_1,Read_Data_2_2,data_to_reg_in_jmp_2

    );
    
    always@(posedge clk)
    begin
    ALU_result_1<=ALU_result;
    Rdst_2<=Rdst_1;
    Regwrite_2<=Regwrite_1;
    Mem_write_2<=Mem_write_1;
    Read_Data_2_2<=Read_Data_2_1;
    Mem_Reg_2<=Mem_Reg_1;
    data_to_reg_in_jmp_2<=data_to_reg_in_jmp_1;
    Mem_Read_2<=Mem_Read_1;
    end

endmodule
