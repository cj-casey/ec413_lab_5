module SLT #(
    parameter WIDTH = 32
)(
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input clk,
    output reg out
);
    always @(clk) begin
        if (a[WIDTH-1] == 0 && b[WIDTH-1] == 0) begin
            assign out = (a < b)? 1: 0;
        end else if (a[WIDTH-1] == 1 && b[WIDTH-1] == 1) begin
            assign out = (a < b)? 1: 0;
        end else if (a[WIDTH-1] == 0 && b[WIDTH-1] == 1) begin
            assign out = 1;
        end else if (a[WIDTH-1] == 1 && b[WIDTH-1] == 0) begin
            assign out = 0;
        end else begin
            assign out = 0;
        end
    end

endmodule