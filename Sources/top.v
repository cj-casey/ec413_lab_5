module top #(
    parameter WIDTH = 32
)(
    input [WIDTH-1:0] R2,
    input [WIDTH-1:0] R3,
    input [2:0] ALUOp,
    input clk,
    output [WIDTH-1:0] R0,
    output overflow,
    output zero,
    output carry
);
   
    wire [WIDTH-1:0] R1;
    wire overflow_pipe;
    wire zero_pipe;
    wire carry_pipe;

    ALU #(
        .WIDTH(WIDTH)
    ) ALU(
        .R2(R2),
        .R3(R3),
        .ALUOp(ALUOp),
        .clk(clk),
        .R1(R1),
        .overflow(overflow),
        .zero(zero),
        .carry(carry)
    );

    reg_file #(
        .WIDTH(WIDTH)
    ) reg_file(
        .R1(R1),
        .overflow_in(overflow_pipe),
        .zero_in(zero_pipe),
        .carry_in(carry_pipe),
        .clk(clk),
        .R0(R0),
        .overflow(overflow),
        .zero(zero),
        .carry(carry)
    );

    
endmodule
