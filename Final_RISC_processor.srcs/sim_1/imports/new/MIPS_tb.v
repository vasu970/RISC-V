`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2024 16:54:08
// Design Name: 
// Module Name: MIPS_tb
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


module RISC_tb();

reg clk=0;
reg reset;

Top_module  t1(clk,reset);
//initial
//begin
always #5 clk=~clk;
initial
begin
reset=0;
#1 reset=1;
#11 reset=0;
#1100 $finish;
end



endmodule
