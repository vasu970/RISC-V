`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2024 21:31:35
// Design Name: 
// Module Name: Branch_predictor_static_not_take
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


module Branch_predictor_static_not_take(

input Branch,z,
output reg Flush=0

    );
    
    always@(*)
    if(Branch&&z)
    Flush=1;
    else
    Flush=0;
    
    
    
endmodule
