module Verification_ALU #(parameter WIDTH = 32) (
    input [WIDTH-1:0] R2,
    input [WIDTH-1:0] R3,
    input [2:0] ALUOp,
    input clk,
    output reg [WIDTH-1:0] R1,
    output reg overflow,
    output reg zero,
    output reg carry
    );
    wire overflow1,overflow2;
    
    always @(posedge clk) begin
        case (ALUOp)
            0: begin 
                R1 = R2;
                carry = 0;
            end 1: begin 
                R1 = ~R2;
                carry = 0;
            end 2: begin 
                {carry,R1} = R2 + R3;
            end 3: begin
                R1 = ~(R2 | R3);
                carry = 0;
            end 4: begin 
                R1 = R2 - R3;
            end 5: begin
                R1 = ~(R2 & R3);
                carry = 0;
            end 6: begin
                R1 = R2 & R3;
                carry = 0;
            end 7: begin
                R1 = (R2 < R3)? 1: 0;
                carry = 0;
            end default: begin
                R1 = 0;
                carry = 0;
            end
        endcase
    end
    AND3 a0(overflow1,R2[WIDTH-1],R3[WIDTH-1],~R1[WIDTH-1]); 
    AND3 a1(overflow2,~R2[WIDTH-1],~R3[WIDTH-1],R1[WIDTH-1]);
    
    
    
    always @(posedge clk) begin
    overflow = overflow1 || overflow2;
    if(R1 == 0) begin
    zero <= 1;
    end
    else begin
    zero <= 0;
    end
    end


endmodule