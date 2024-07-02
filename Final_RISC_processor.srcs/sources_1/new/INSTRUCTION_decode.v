`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2024 18:34:14
// Design Name: 
// Module Name: INSTRUCTION_decode
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


module INSTRUCTION_decode(
input clk,clk_stall,reset,
input  [31:0]Write_Data_to_reg,Instruction_code_1,PC,
input Regwrite_3,
input[4:0]Rdst_3,Rdst,Rscr1,Rscr2,
input [6:0] opcode,Function7,
input[2:0] Function3,
output  Regwrite,
output  ALUSrc,
output  Branch,
output  Mem_write,
output  Mem_Reg,
output  Mem_Read,Jump,
output reg z=0,
output  [1:0] ALUOp,
output  [31:0] Read_Data_1,
output  [31:0] Read_Data_2 ,Imm_out1,
output reg  [31:0]data_to_reg_in_jmp,
output reg[32:0] jalr=0  ,
output reg[4:0] Rdst_r,Rscr1_r,Rscr2_r
 );
wire [1:0] ImmSel;
reg  [6:0] opcode_1;
wire [32:0] Lef_1;
//reg z;
//wire[31:0]Imm_out1;
//reg[4:0]Rscr1_r,Rscr2_r;
Imm_Gen s22(Instruction_code_1,ImmSel, Imm_out1);//Immediate generation block

    Register_file REGISTER_MEMORY( Rscr1_r,Rscr2_r,Rdst_3,
Write_Data_to_reg, clk,reset,Regwrite_3,Read_Data_1,Read_Data_2);
    
    control s6( opcode_1,Regwrite,ALUSrc,
 Branch,Mem_write,ImmSel,Mem_Reg,Mem_Read,Jump,ALUOp);
    
    Shift_left s12(Imm_out1,Lef_1);
    
    always@(*)
begin
//if(opcode==7'bxxxxxxx)
//jalr=0;
    if(clk_stall==1)
    begin
    opcode_1=7'b11_111_11;
    Rscr1_r=0;
    Rscr2_r=0;
    Rdst_r=0;
    end
    else
    begin
    Rscr1_r=Rscr1;
    Rscr2_r=Rscr2;
    Rdst_r=Rdst;
    opcode_1=opcode;
end
if(opcode==7'b000_00_11)
Rscr2_r=0;

end
    
    
    
     always@(*)
    if(opcode_1==7'b11_0_1111)//jump type
    begin
    data_to_reg_in_jmp=PC;
    z=1;
    case(Function3)   
    0:jalr=Lef_1+Read_Data_1;
    default:jalr=Lef_1;
    endcase
  
    end
      else 
      begin
      jalr=Lef_1;
      z=0;
      end
 
    always@(*)
    if(opcode_1==7'b11_000_11)//branch type
    case(Function3)
    0:
        if(Read_Data_1==Read_Data_2)
        z=1;
    1:   if(Read_Data_1!=Read_Data_2)
              z=1;
    4:   if(Read_Data_1<Read_Data_2)     
       z=1;
     5:   if(Read_Data_1>=Read_Data_2)     
       z=1;
       default: z=0;
//     6:    if(Read_Data_1<Read_Data_2)     
//       z=1;
//     7:    if(Read_Data_1<Read_Data_2)     
//       z=1;
endcase




endmodule
