`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2024 08:00:58 PM
// Design Name: 
// Module Name: AND_p
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


module AND_p #(parameter WIDTH = 1)(
    output [WIDTH-1:0] Z,
    input  [WIDTH-1:0] A,
    input  [WIDTH-1:0] B
    );
     
    generate
    genvar i;
    for(i = 0; i < WIDTH; i = i+1) begin
    AND2 u0(Z[i],A[i],B[i]);
    end
    endgenerate
endmodule
