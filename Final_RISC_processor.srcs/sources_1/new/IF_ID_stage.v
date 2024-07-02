`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2024 16:14:22
// Design Name: 
// Module Name: IF_ID_stage
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


module IF_ID_stage(
input clk,
input [31:0] Instruction_code,
output reg [31:0] Instruction_code_1

    );
    always@(posedge clk)
//    begin
//    if(Flush!=1)
    Instruction_code_1<=Instruction_code;
//    else
//    Instruction_code_1<=0;
//    end
//D_flipflop #(32) e2(clk,Instruction_code,Instruction_code_1);//1 st stage of pipeline
    
    
    
endmodule
