`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2024 07:54:12 PM
// Design Name: 
// Module Name: NAND
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


module NAND #(parameter WIDTH = 32)(
    output [WIDTH-1:0] Z,
    input [WIDTH-1:0] R2,
    input [WIDTH-1:0] R3
    );
    wire and_to_not;
    
    generate
    genvar i;
    for(i = 0; i < WIDTH; i = i + 1)
    begin
    AND2 o0(and_to_not,R2,R3);
    NOT n0(Z[i],and_to_not);
    end
    endgenerate
    
endmodule

