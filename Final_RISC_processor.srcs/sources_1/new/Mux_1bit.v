`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2024 21:00:45
// Design Name: 
// Module Name: Mux_1bit
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


module Mux_1bit(
input a,b,
input sel,
output reg out
    );
always@(*)
case(sel)
0:out=a;
1:out=b;
endcase  
    
endmodule
