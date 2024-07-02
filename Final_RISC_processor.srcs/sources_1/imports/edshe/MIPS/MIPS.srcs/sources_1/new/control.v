`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2024 22:02:04
// Design Name: 
// Module Name: control
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

//input [6:0]  Function7,
module control(
input [6:0] opcode,
//input Zero,
//input [2:0]  Function3,
output reg Regwrite=0,
output reg ALUSrc=0,
output reg Branch=0,
output reg Mem_write=0,
output reg [1:0]ImmSel,
output reg Mem_Reg=0,
output reg Mem_Read=0,Jump=0,
output reg [1:0] ALUOp
    );
always@(*)
    case(opcode)
      7'b0110011: //register type instruction
    begin
     ALUSrc=0;//should pass in pipeline
     Mem_Read=0;
     Mem_Reg=0;
     Regwrite=1;//should pass in pipeline
      ALUOp=2'b10;//should pass in pipeline
      Mem_write=0;
       Branch=0;
       Jump=0;
 end
     7'b0010011://immediate type instruction
    begin
    ALUSrc=1;
    Mem_Reg=1'b0;
Mem_Read=0;
    Regwrite=1;
    ImmSel=2'b00;//modified this
     ALUOp=2'b10;
    Mem_write=0;
     Branch=0;
     Jump=0;
// sel=( Function==0||Function==2);
 end
      7'b000_00_11://load  type instruction
    begin
    ALUSrc=1;
    Mem_Reg=1;
    Regwrite=1;
    Mem_Read=1;
    ImmSel=0;
     ALUOp=2'b00;
     Mem_write=0;
      Branch=0;
      Jump=0;
//    Mem_write=1;
 end
 
  7'b11_000_11://branch type instruction
    begin
//    if(Zero==1)
//    begin
    ALUSrc=0;
    Mem_Reg=1'b0;
    Regwrite=0;
    ImmSel=2'b10;
    Mem_Read=0;
     Branch=1;
    ALUOp=2'b01;
    Mem_write=0;
    Jump=0;
//    end
 end
 
 7'b01_000_11://store byte half word instruction
    begin
    
    ALUSrc=1;
     ALUOp=2'b00;
    Mem_Reg=1'bx;
    Regwrite=0;
    ImmSel=2'b01;
    Mem_Read=0;
     Branch=0;
    Mem_write=1;
    Jump=0;

 end
      7'b11_0_1111://jump  type instruction
    begin
    ALUSrc=1;
    Mem_Reg=0;
    Regwrite=1;
    ImmSel=2'b11;
    Jump=1;
    Branch=1;
//     PCSrc=1;
     ALUOp=2'b00;
//    Mem_write=1;
// sel=( Function==0||Function==2);
 end
  7'b11_1_1111://stall  type instruction
    begin
    ALUSrc=0;
    Mem_Reg=0;
    Regwrite=0;
    ImmSel=2'b00;
    Jump=0;
    Branch=0;
//     PCSrc=1;
     ALUOp=2'b00;
    Mem_write=0;
    Mem_Read=0;
// sel=( Function==0||Function==2);
 end
   7'b00_0_0000://stall  type instruction
    begin
    ALUSrc=0;
    Mem_Reg=0;
    Regwrite=0;
    ImmSel=2'b00;
    Jump=0;
    Branch=0;
//     PCSrc=1;
     ALUOp=2'b00;
    Mem_write=0;
    Mem_Read=0;
// sel=( Function==0||Function==2);
 end
     endcase

endmodule
