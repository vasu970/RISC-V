`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2024 16:22:54
// Design Name: 
// Module Name: FORWARD_UNIT
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


module FORWARD_UNIT(
input [4:0]rs1,rs2,rd_from_ex,rd_from_mem,
input Mem_read,Mem_write,
input regwrite_for_ex,regwrite_for_mem,
output reg[1:0] forward1=0,
output reg[1:0] forward2=0
    );
    always@(*)
    begin
//    if((rd_from_ex!=0)&&(rs1!=0)&&(rs2!=0)&&(rd_from_mem!=0))
//    begin
//    if((Mem_read==0)&&(Mem_write==0))
//    begin
    if((rs1==rd_from_ex)&&(rd_from_ex!=0))
    forward1=2'b01;//from ex we have to take data
    else if(rs1==rd_from_mem&&(rd_from_mem!=0))
    forward1=2'b10;//from ex rs2 we have to take data
    else
    forward1=2'b00;//both are matching both should be provided with data
    if((rs2==rd_from_ex)&&(rd_from_ex!=0))
    forward2=2'b01;//from ex we have to take data
    else if(rs2==rd_from_mem&&(rd_from_mem!=0))
    forward2=2'b10;//from ex rs2 we have to take data
    else
    forward2=2'b00;//both are matching both should be provided with data
    end
//    end
//    end
    
    
//    ||(rs2==rd_from_ex))
endmodule
