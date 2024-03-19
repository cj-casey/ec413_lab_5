module reg_file #(
    parameter WIDTH = 32
)(
    input [WIDTH-1:0] R1,
    input overflow_in,
    input zero_in,
    input carry_in,

    input clk,

    output reg [WIDTH-1:0] R0,
    output reg overflow,
    output reg zero,
    output reg carry
);

    always @(posedge clk) begin
        R0 <= R1;
        overflow <= overflow_in;
        zero <= zero_in;
        carry <= carry_in;
    end
    

endmodule
