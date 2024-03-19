module Verification_ALU;

    parameter WIDTH = 32;

    input [WIDTH-1:0] R2;
    input [WIDTH-1:0] R3;
    input [2:0] ALUOp;
    input clk;
    output reg [WIDTH-1:0] R1;

    always @(posedge clk) begin
        case (ALUOp)
            0: begin 
                R1 = R2;
            end 1: begin 
                R1 = ~R2;
            end 2: begin 
                R1 = R2 + R3;
            end 3: begin
                R1 = ~(R2 | R3);
            end 4: begin 
                R1 = R2 - R3;
            end 5: begin
                R1 = ~(R2 & R3);
            end 6: begin
                R1 = R2 & R3;
            end 7: begin
                R1 = (R2 < R3)? 1: 0;
            end default: begin
                R1 = 0;
            end
        endcase
    end


endmodule