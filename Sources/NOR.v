`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2024 07:34:02 PM
// Design Name: 
// Module Name: NOR
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


module NOR #(parameter WIDTH = 32)(
    output [WIDTH-1:0] Z,
    input [WIDTH-1:0] R2,
    input [WIDTH-1:0] R3
    );
    wire or_to_not;
    
    generate
    genvar i;
    for(i = 0; i < WIDTH; i = i + 1)
    begin
    OR4 o0(or_to_not,R2,R3,R2,R3);
    NOT n0(Z[i],or_to_not);
    end
    endgenerate
    
endmodule
