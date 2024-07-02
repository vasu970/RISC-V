`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2024 15:02:39
// Design Name: 
// Module Name: sign_extension
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


module sign_extension(
input [11:0]immediate,
output  [31:0] sign_extended
    );
    assign sign_extended[31:12]={20{immediate[11]}};
   assign sign_extended[11:0]= {immediate[11:0]};
    
    
endmodule
