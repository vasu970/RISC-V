`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2024 16:06:38
// Design Name: 
// Module Name: Register_file
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
module Register_file(
input [4:0] Read_Reg_num_1,
input [4:0] Read_Reg_num_2,
input [4:0] write_Reg_num,
input [31:0] Write_Data,
input clk,reset,Regwrite,
output reg [31:0] Read_Data_1,
output reg [31:0] Read_Data_2

    );
    integer i;
        reg [31:0] Mem [31:0];
    always@(*)//posedge clk, posedge reset
//always@(*)
    begin
    if(reset)
    for(i=0 ;i<32;i=i+1)
     Mem[i]<=i;
    else 
if(Regwrite)
if(write_Reg_num!=0)
    Mem[write_Reg_num]<=Write_Data;
    end
    always@(*)//negedge clk
//always@(*)
//if((Read_Reg_num_1!=0)&&(Read_Reg_num_2!=0))
    begin
      Read_Data_1<=Mem[Read_Reg_num_1];
     Read_Data_2<=Mem[Read_Reg_num_2];
     end
endmodule
