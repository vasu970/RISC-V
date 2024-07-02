`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2024 08:59:25
// Design Name: 
// Module Name: PC_adder_block
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


module PC_adder_block(
input clk,reset,PCSrc,
input[31:0] PC_1,
output reg [31:0] PC
    );
    
    
//    ,posedge PCSrc
    
always@(posedge clk)
    begin
    if(reset==1&&PCSrc==0)
    PC<=0;
    else if(PCSrc==1)
    PC<=PC_1;
    else
    PC<=PC+4;
    end
endmodule
