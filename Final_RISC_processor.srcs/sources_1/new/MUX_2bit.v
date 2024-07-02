`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2024 16:57:12
// Design Name: 
// Module Name: MUX_2bit
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


module MUX_2bit(
input [31:0] Read_register_data,ALU_result,Mem_Mux_out,
input [1:0]sel,
output reg [31:0] out

    );
    always@(*)
    begin
    if(sel==1)
    out=ALU_result;
    else if(sel==2)
    out=Mem_Mux_out;
    else
    out =Read_register_data;
    end
//    assign out=(sel==1)?A:B;
endmodule
