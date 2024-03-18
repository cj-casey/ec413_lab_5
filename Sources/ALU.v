`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 06:19:16 PM
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


module ALU #(
    parameter WIDTH = 32
)(
    input [WIDTH-1:0] R2,
    input [WIDTH-1:0] R3,
    input [2:0] ALUOp,
    output reg [WIDTH-1:0] R0,
    output reg overflow,
    output reg zero,
    output reg carry
);
    
    wire [WIDTH-1:0] adder_to_mux;
    wire [WIDTH-1:0] R1;

    adder my_adder(
        .a(R2),
        .b(R3),
        .c_in(1'b0),
        .sum(adder_to_mux),
        .c_out(carry)

    )
    
endmodule
