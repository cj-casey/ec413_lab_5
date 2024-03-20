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
    wire [WIDTH-1:0] or_to_not;
    
    wire add_carry_to_mux;
    wire sub_carry_to_mux;
    wire add_overflow_to_mux;
    wire sub_overflow_to_mux;
    wire sub_zero_to_mux;
    wire add_zero_to_mux;

    NOT #(WIDTH) my_not(
        .Z(not_to_mux),
        .A(R2)
    );

    adder_p #(WIDTH) my_add(
        .A(R2),
        .B(R3),
        .cin(1'b0),
        .SUM(add_to_mux),
        .cout(add_carry_to_mux),
        .OVERFLOW_FLAG(add_overflow_to_mux),
        .ZERO_FLAG(add_zero_to_mux)
    );
    
    NOR #(WIDTH) n0(
        .Z(nor_to_mux),
        .R2(R2),
        .R3(R3)
    );
    
    subtractor_p #(WIDTH) my_sub (
        .A(R2),
        .B(R3),
        .SUM(sub_to_mux),
        .OVERFLOW_FLAG(sub_overflow_to_mux),
        .cout(sub_carry_to_mux),
        .ZERO_FLAG(sub_zero_to_mux),
        .cin(1'b0)
    );

    NAND #(WIDTH) my_nand (
        .R2(R2),
        .R3(R3),
        .Z(nand_to_mux)
    );

    AND_p #(WIDTH) my_and (
        .A(R2),
        .B(R3),
        .Z(and_to_mux)
    );

    SLT #(WIDTH) my_slt (
        .a(R2),
        .b(R3),
        .out(slt_to_mux),
        .clk(clk)
    );
    
    always @(posedge clk) begin
        case (ALUOp)
                3'b000: begin 
                R1 <= R2;
                carry <= 0;
                overflow <= 0;
            end 3'b001: begin 
                R1 <= not_to_mux;
                carry <= 0;
                overflow <= 0;
            end 3'b010: begin 
                R1 <= add_to_mux;
                carry <= add_carry_to_mux;
                overflow <= add_overflow_to_mux;
            end 3'b011: begin
                R1 <= nor_to_mux;
                carry <= 0;
                overflow <= 0;
            end 3'b100: begin 
                R1 <= sub_to_mux;
                carry <= sub_carry_to_mux;
                overflow <= sub_overflow_to_mux;
            end 3'b101: begin
                R1 <= nand_to_mux;
                carry <= 0;
                overflow <= 0;
            end 3'b110: begin
                R1 <= and_to_mux;
                carry <= 0;
                overflow <= 0;
            end 3'b111: begin
                R1 <= slt_to_mux;
                carry <= 0;
                overflow <= 0;
            end default: begin
                R1 <= 0;
                carry <= 0;
                overflow <= 0;
            end
        endcase

        assign zero = (R1 == 0);
    end


    
endmodule
