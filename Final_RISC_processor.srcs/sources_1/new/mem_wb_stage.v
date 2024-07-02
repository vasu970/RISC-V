`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2024 16:17:52
// Design Name: 
// Module Name: mem_wb_stage
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


module mem_wb_stage(
input clk,Regwrite_2,Mem_Reg_2,
input [4:0] Rdst_2,
input[31:0] ALU_result_1,data_to_reg_in_jmp_2,
output reg Regwrite_3,Mem_Reg_3,
output reg [4:0] Rdst_3,
output reg [31:0] ALU_result_2,data_to_reg_in_jmp_3

    );
    
    always@(posedge clk)
    begin
    ALU_result_2<=ALU_result_1;
    Rdst_3<=Rdst_2;
    Regwrite_3<=Regwrite_2;
    Mem_Reg_3<=Mem_Reg_2;
    data_to_reg_in_jmp_3<=data_to_reg_in_jmp_2;
//    Mem_Read_3<=Mem_Read_2;
    end
    
//    D_flipflop #(32) d5(clk,ALU_result,ALU_result_1);//3 st stage of pipeline
//    D_flipflop #(5) d2(clk,Rdst_1,Rdst_2);//third stage of pipeline
//    D_flipflop #(1) d12(clk,Regwrite_1,Regwrite_2);//fourth stage of pipeline
endmodule
