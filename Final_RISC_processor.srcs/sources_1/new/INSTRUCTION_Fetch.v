`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2024 18:26:56
// Design Name: 
// Module Name: INSTRUCTION_Fetch
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


module INSTRUCTION_Fetch(
input clk,reset,Branch,Jump,Zero,Flush,
input[32:0]Lef_1,
output reg [31:0]Instruction_code_1,
output [31:0]PC

    );
    
    wire [31:0] Instruction_code;
    
    wire Z;
//    wire[31:0] PC;
    assign Z=(Jump)? Jump:Zero;
       
    always@(*)
    begin
    if(Flush!=1)
    Instruction_code_1<=Instruction_code;
    else
    Instruction_code_1<=0;
    end
    
    
       Instruction_Memory f1(PC,reset,Instruction_code);//getting instruction code from memory
    PC P1(clk,reset,Branch,Z,Lef_1,PC);
    
endmodule
