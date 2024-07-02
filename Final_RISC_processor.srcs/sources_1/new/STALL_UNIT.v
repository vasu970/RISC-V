`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2024 06:26:19
// Design Name: 
// Module Name: STALL_UNIT
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


module STALL_UNIT(
input clk,Mem_read,
input [4:0]ID_EX_Rd,
input [4:0]IF_ID_Rs1,
input [4:0]IF_ID_Rs2,
output reg clk_stall,stall
    );
    always@( *)
    begin
    if(((ID_EX_Rd==IF_ID_Rs1)||(ID_EX_Rd==IF_ID_Rs2))&&(Mem_read==1))
    begin
    clk_stall=0;
    stall=1;
    end
    else 
    begin
    clk_stall=clk;
    stall=0;
    end
    end

    endmodule
