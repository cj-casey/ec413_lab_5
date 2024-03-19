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
    input clk,
    output reg [WIDTH-1:0] R1,
    output reg overflow,
    output reg zero,
    output reg carry
);
    wire [WIDTH-1:0] not_to_mux;
    wire [WIDTH-1:0] add_to_mux;
    wire [WIDTH-1:0] nor_to_mux;
    wire [WIDTH-1:0] sub_to_mux;
    wire [WIDTH-1:0] nand_to_mux;
    wire [WIDTH-1:0] and_to_mux;
    wire [WIDTH-1:0] slt_to_mux;

    wire add_carry_to_mux;
    wire sub_carry_to_mux;
    wire add_overflow_to_mux;
    wire sub_overflow_to_mux;

    not my_not #(WIDTH) (
        .a(R2),
        .out(not_to_mux),
        .clk(clk)
    );

    adder my_add #(WIDTH) (
        .a(R2),
        .b(R3),
        .c_in(1'b0),
        .sum(add_to_mux),
        .c_out(add_carry_to_mux),
        .overflow(add_overflow_to_mux),
        .clk(clk)
    );

    nor my_nor #(WIDTH) (
        .a(R2),
        .b(R3),
        .out(nor_to_mux),
        .clk(clk)
    );

    subtractor my_sub #(WIDTH) (
        .a(R2),
        .b(R3),
        .diff(sub_to_mux),
        .overflow(sub_overflow_to_mux),
        .c_out(sub_carry_to_mux),
        .clk(clk)
    );

    nand my_nand #(WIDTH) (
        .a(R2),
        .b(R3),
        .out(nand_to_mux),
        .clk(clk)
    );

    and my_and #(WIDTH) (
        .a(R2),
        .b(R3),
        .out(and_to_mux),
        .clk(clk)
    );

    SLT my_slt #(WIDTH) (
        .a(R2),
        .b(R3),
        .out(slt_to_mux),
        .clk(clk)
    );

    always @(posedge clk) begin
        case (ALUOp)
            0: begin 
                R1 = R2;
                carry = 0;
                overflow = 0;
            end 1: begin 
                R1 = not_to_mux;
                carry = 0;
                overflow = 0;
            end 2: begin 
                R1 = add_to_mux;
                carry = add_carry_to_mux;
                overflow = add_overflow_to_mux;
            end 3: begin
                R1 = nor_to_mux;
                carry = 0;
                overflow = 0;
            end 4: begin 
                R1 = sub_to_mux;
                carry = sub_carry_to_mux;
                overflow = sub_overflow_to_mux;
            end 5: begin
                R1 = nand_to_mux;
                carry = 0;
                overflow = 0;
            end 6: begin
                R1 = and_to_mux;
                carry = 0;
                overflow = 0;
            end 7: begin
                R1 = slt_to_mux;
                carry = 0;
                overflow = 0;
            end default: begin
                R1 = 0;
                carry = 0;
                overflow = 0;
            end
        endcase

        assign zero = (R1 == 0);
    end


    
endmodule
