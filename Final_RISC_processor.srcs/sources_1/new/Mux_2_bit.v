`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2024 20:38:48
// Design Name: 
// Module Name: Mux_2_bit
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


module Mux_2_bit(
input a,b,c,d,
    input [1:0] sel,
    output reg out
    
    );
    always@(*)
    case(sel)
    2'b00:
    out=a;
    2'b01:
    out=b;
    2'b10:
    out=c;
    2'b11:
    out=d;
    endcase
    
    
    
endmodule
