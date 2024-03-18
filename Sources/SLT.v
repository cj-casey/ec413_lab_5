module SLT #(
    parameter WIDTH = 32
)(
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input clk,
    output reg out
);
    always @(clk) begin
        if ([WIDTH-1]a == 0 && [WIDTH-1]b == 0) begin
            out = (a < b)? 1: 0;
        end else if ([WIDTH-1]a == 1 && [WIDTH-1]b == 1) begin
            out = (a < b)? 1: 0;
        end else if ([WIDTH-1]a == 0 && [WIDTH-1]b == 1) begin
            out = 1;
        end else if ([WIDTH-1]a == 1 && [WIDTH-1]b == 0) begin
            out = 0;
        end else begin
            out = 0;
        end
    end

endmodule