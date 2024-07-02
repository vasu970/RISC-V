`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2024 15:30:25
// Design Name: 
// Module Name: PC
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
module PC(
input clk,reset,Branch,Zero,
input signed [32:0]Lef_1,
output reg [31:0] PC
    );
//    wire [32:0]Lef_1;
    reg PCSrc;
  reg [31:0] PC_plus_x,PC_1;

//PCSrc=(Branch&&Zero);
always@(*)
begin
PC_plus_x=Lef_1+PC;
PCSrc=(Branch&&Zero);
end
always@(posedge clk)
    begin
    if(reset==1)
    PC<=0;
    else if(PCSrc)
    PC<=PC_plus_x;
    else
    PC<=PC+4;
    end
endmodule
















//    always@( *)
//    if(PCSrc)
//    PC<=PC_plus_x;
//    else 
//    PC<=PC;
//PC_adder_block Pc_block(clk,reset,PCSrc,PC_1, PC );
//MUX s11(PC_plus_x,PC,PCSrc,PC);
//;
//Shift_left s12(Imm_out1,Lef_1);