`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2024 16:23:07
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(
input [31:0] PC,
//input clk,
input reset,
output [31:0] Instruction_code 

    );
    reg [7:0] mem [53:0];
    assign Instruction_code={mem[PC+3],mem[PC+2],mem[PC+1],mem[PC]};
    always@(*)
    begin
    if(reset==0)
    begin
////{ Mem[0],Mem[1],Mem[2], Mem[3]}=32'b0000000_10010_00100_000_00011_0110011;//reg type instruction for addition of two numbers   add X3,X4,X18 
//{ Mem[4],Mem[5],Mem[6], Mem[7]}=32'b000000001100_00011_000_00011_0000011;//reg type instruction for addition of two numbers   add X3,X4,X18 
////{ Mem[4],Mem[5],Mem[6], Mem[7]}=32'b0100000_10011_00011_000_00011_0110011;//reg type instruction for Subraction of two numbers Sub X3,X3,X19
////{ Mem[8],Mem[9],Mem[10], Mem[11]}=32'b0100000_10111_10100_110_00011_0110011;////reg type instruction for or of two numbers Or X3,X20,X23
//{ Mem[12],Mem[13],Mem[14], Mem[15]}=32'b010_0000_10001_01100_111_00111_0110011;////reg type instruction for and of two numbers AND X7,X12,X17
////{ Mem[16],Mem[17],Mem[18], Mem[19]}=32'b0000000_00001_00101_001_00011_0110011;//reg type instruction for SLL of two numbers  SLL X3,X5,X1
//{ Mem[20],Mem[21],Mem[22], Mem[23]}=32'b0000000_00010_10000_101_00010_0110011;//reg type instruction for SRL of two numbers  SRL X2,X16,X2

//{ Mem[8],Mem[9],Mem[10], Mem[11]}=32'b000000001110_00100_000_00011_0010011;//Immediate type instruction for addition of two numbers Addi X3,X4,12
////{ Mem[12],Mem[13],Mem[14], Mem[15]}=32'b010_0000_10000_10000_000_00011_0010011;//Immediate type instruction for  of two numbers
//{ Mem[16],Mem[17],Mem[18], Mem[19]}=32'b0100000_11100_11100_000_00011_1100011;//Branch type instruction for equality of two numbers Beq
////{ Mem[20],Mem[21],Mem[22], Mem[23]}=32'b
//{ Mem[0],Mem[1],Mem[2], Mem[3]}=32'b000000001110_00100_000_00011_0000011;//load_word type instruction for addition of two numbers lw x3,14(X4)
//    Mem[4]=8'b0_0000000;//Jump type instruction 
//    Mem[5]=8'b010_0_0000;
//    Mem[6]=8'b0_000_0001;
//    Mem[7]=8'b1_1101111;
//    Mem[8]=8'b000_0000_0;//reg type instruction for SLL of two numbers
//    Mem[9]=8'b0001_0010;
//    Mem[10]=8'b1_001_0001;
//    Mem[11]=8'b1_0110011;   
//     Mem[12]=8'b010_0000_1;//reg type instruction for or of two numbers
//    Mem[13]=8'b0011_1010;
//    Mem[14]=8'b0_110_0001;
//    Mem[15]=8'b1_0110011;    
//    Mem[16]=8'b010_0000_0;//reg type instruction for and of two numbers
//    Mem[17]=8'b0011_0110;
//    Mem[18]=8'b0_111_0011;
//    Mem[19]=8'b1_0110011;
//        Mem[20]=8'b000_0000_0;//reg type instruction for SRL of two numbers
//    Mem[21]=8'b0010_1000;
//    Mem[22]=8'b0_101_0001;
//    Mem[23]=8'b1_0110011;
  
//Mem[8]=8'b000_0000_0;//Immediate type instruction for addition of two numbers
//    Mem[9]=8'b1100_0010;
//    Mem[10]=8'b0_111_0001;
//    Mem[11]=8'b1_0010011;
//    Mem[12]=8'b010_0000_1;//Immediate type instruction for Subraction of two numbers
//    Mem[13]=8'b0000_1000;
//    Mem[14]=8'b0_000_0001;
//    Mem[15]=8'b1_0010011;
    
//    Mem[16]=8'b010_0000_1;//Branch type instruction for Subraction of two numbers
//    Mem[17]=8'b1100_1110;
//    Mem[18]=8'b0_000_0001;
//    Mem[19]=8'b1_1100011;
    
//      Mem[16]=8'b000_0000_0;//Store type instruction for  of two numbers
//    Mem[17]=8'b1100_0110;
//    Mem[18]=8'b0_000_0000;
//    Mem[19]=8'b1_0100011;

   {mem[3] , mem[2] , mem[1] , mem[0] } = 32'b000000001010_00000_000_00011_0010011; // addi x3, x0, 10

    {mem[7] , mem[6] , mem[5] , mem[4] } = 32'b000000000001_00000_000_00001_0010011; // addi x1, x0, 1
    
    {mem[11], mem[10], mem[9] , mem[8] } = 32'b0000000_00001_00111_010_00001_0100011; // sw x1, 1(x7)
    
    {mem[15], mem[14], mem[13], mem[12]} = 32'b0000000_00000_00111_010_00000_0100011; // sw x0, 0(x7)
    
    {mem[19], mem[18], mem[17], mem[16]} = 32'b000000000000_00111_010_00001_0000011; // lw x1, 0(x7)
    
    {mem[23], mem[22], mem[21], mem[20]} = 32'b000000000001_00111_010_00010_0000011; // lw x2, 1(x7)
    
    {mem[27], mem[26], mem[25], mem[24]} = 32'b0000000_00000_00011_000_11000_1100011; // beq x3, x0, 20
    
    {mem[35], mem[34], mem[33], mem[32]} = 32'b0000000_00010_00001_000_00100_0110011; // add x4, x1, x2
    
    {mem[39], mem[38], mem[37], mem[36]} = 32'b0000000_00100_00111_010_00010_0100011; // sw x4, 2(x7)
    
    {mem[43], mem[42], mem[41], mem[40]} = 32'b111111111111_00011_000_00011_0010011; // addi x3, x3, -1
    
    {mem[47], mem[46], mem[45], mem[44]} = 32'b000000000001_00111_000_00111_0010011; // addi x7, x7, 1
   
     {mem[51], mem[50], mem[49], mem[48]} = 32'b1_1111110111_1_11111111_00101_1101111; // jal x5, -32



 end
 end
endmodule
//    Mem[3]=32'b00000001001010000101000000100101;
//    Mem[4]=32'b00000001011000110000000110000000;
//    Mem[5]=32'b00000001101010010000001010000010;
    
//    Mem[6]=32'b11111101011000000000000000000011;
//     Mem[7]=32'b11111101011000000000000000000111;
//    Mem[8]=32'b00000000000000010001000000100000;
//    Mem[9]=32'b00000000000000010001000000100000;
//    Mem[0]=32'b00000000000000010001000000100000;
//    Mem[0]=32'b00000000000000010001000000100000;
//    Mem[0]=32'b00000000000000010001000000100000;
//    Mem[0]=32'b00000000000000010001000000100000;
 
//{ Mem[0],Mem[1],Mem[2], Mem[3]}=32'b0000000_10010_00100_000_00011_0110011;//reg type instruction for addition of two numbers   add X3,X4,X18 
//{ Mem[4],Mem[5],Mem[6], Mem[7]}=32'b0100000_10011_00110_000_00011_0110011;//reg type instruction for Subraction of two numbers Sub X3,X6,X19
//{ Mem[8],Mem[9],Mem[10], Mem[11]}=32'b0100000_10111_10100_110_00011_0110011;////reg type instruction for or of two numbers Or X3,X20,X23
//{ Mem[12],Mem[13],Mem[14], Mem[15]}=32'b010_0000_10001_01100_111_00111_0110011;////reg type instruction for and of two numbers AND X7,X12,X17
//{ Mem[16],Mem[17],Mem[18], Mem[19]}=32'b0000000_00001_00101_001_00011_0110011;//reg type instruction for SLL of two numbers  SLL X3,X5,X1
//{ Mem[20],Mem[21],Mem[22], Mem[23]}=32'b0000000_00010_10000_101_00011_0110011;//reg type instruction for SRL of two numbers  SRL X3,X16,X2
