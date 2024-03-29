`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 06:45:45 PM
// Design Name: 
// Module Name: AND
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


module NOT #(parameter WIDTH = 1)(
    output [WIDTH-1:0] Z,
    input  [WIDTH-1:0] A
    );
    
    
    
    generate
    genvar i;
    for(i = 0; i < WIDTH; i = i+1) begin
    nand u0(Z[i],A[i],A[i]);
    end
    endgenerate
endmodule
