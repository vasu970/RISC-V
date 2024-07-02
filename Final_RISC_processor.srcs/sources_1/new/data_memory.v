`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2024 16:04:03
// Design Name: 
// Module Name: data_memory
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


module data_memory(
input clk,
input reset,Mem_write,Mem_read,
input [31:0]address,
input [31:0]write_data,
output reg [31:0] Read_data
    );
reg [31:0] Mem [31:0];
  integer i;
    always@(posedge clk)
    begin
    if(reset)
    for(i=0 ;i<32;i=i+1)
     Mem[i]<=i;
    else if(Mem_write==1)
    Mem[address]=write_data;
    else if(Mem_read==1)
    Read_data<=Mem[address];

    
     end
endmodule

