`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2024 18:47:49
// Design Name: 
// Module Name: ALU
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


module ALU(
input signed [31:0] A,B,
input [1:0]ALUOp,
input [6:0] opcode,
input [6:0]  Function7,
input [2:0] Function3,

//input  [4:0] Shamt,
output reg Zero=0,
output reg signed [31:0] ALU_result);

//reg [31:0] A1;
    always@(*)
    if(ALUOp==2'b10)

  case(opcode)
 7'b0_11_00_11://R-Type
                                        case(Function3)
                                        3'b000:  
                                                        if(Function7==7'b0000000)
                                                        ALU_result<=A+B; 
                                                        else if(Function7==7'b010_0000)
                                                        ALU_result<=A-B; 
                                                                          
                                        3'b100:    ALU_result<= A^B;
                                        3'b110:    ALU_result<=A|B;  
                                        3'b111:    ALU_result<=A&B;
                                        3'b001:    ALU_result<=A<<B;
                                        3'b101: 
                                                        if(Function7==7'b0000000)
                                                ALU_result<=A>>B;
                                                    else if(Function7==7'b010_0000)
                                                ALU_result<=A>>B;
                                        3'b010:  ALU_result<=(A<B)?1:0;
                                        3'b011:  ALU_result<=(A<B)?1:0;
                                        endcase
    
    7'b001_00_11:    //I-type
                                        case(Function3)
                                        3'b000:   ALU_result<=A+B;  
                                        3'b100: ALU_result<= A^B;
                                        3'b110: ALU_result<=A|B;  
                                        3'b111: ALU_result<=A&B;
                                        3'b001:  ALU_result<=A<<B;
                                        3'b101:              if(Function7==7'b0000000)
                                                                ALU_result<=A>>B;
                                                                    else if(Function7==7'b010_0000)
                                                                ALU_result<=A>>B;
                                             
                                        3'b010:  ALU_result<=(A<B)?1:0;
                                        3'b011:  ALU_result<=(A<B)?1:0;
                                                endcase
                                                    
//       7'b00_000_11:   //Load Immediate type instructions
//       7'b01_000_11:   //store Immediate type instructions
//       7'b11_000_11:   //Branch type instructions
//        case(Function3)
//                                        3'b000:    
//                                        if(A==B)
//                                        Zero=1;  
//                                        else if(A!=B)
//                                        Zero=0;
//                                        3'b001: ALU_result<= A^B;
//                                        3'b100: ALU_result<=A|B;  
//                                        3'b101: ALU_result<=A&B;
//                                        3'b110:  ALU_result<=A<<B;
//                                        3'b111:              if(Function7==7'b0000000)
//                                                                ALU_result<=A>>B;
//                                                                    else if(Function7==7'b010_0000)
//                                                                ALU_result<=A>>B;
//                                             endcase
                                                endcase    
       


       else if(ALUOp==2'b01)
       
//              7'b11_000_11:   //Branch type instructions
        case(Function3)
                                        3'b000:    
                                        if(A==B)//branch if equal
                                        Zero=1;  
                                        else if(A!=B)
                                        Zero=0;
                                        
                                        3'b001:    
                                        if(A!=B)//branch if not equal to
                                        Zero=1;  
                                        else if(A==B)
                                        Zero=0;
                                        
                                        3'b100:    //branch if less than
                                        if(A<B)
                                        Zero=1;  
                                        else if(A>B)
                                        Zero=0;
                                        
                                        3'b101:    //branch if greater than or equal
                                        if(A>=B)
                                        Zero=1;  
                                        else
                                        Zero=0;
                                        
                                        endcase
                                        
                                        
        else if(ALUOp==2'b00)                                  
          ALU_result<=A+B;             //store and load instructions                       

       
       
endmodule
