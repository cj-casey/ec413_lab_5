`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2023 09:02:43 AM
// Design Name: 
// Module Name: ALU_tb
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

module ALU_tb;
//Inputs
    parameter n = 32;
    reg [n-1:0] R2;
    reg [n-1:0] R3;
    reg [2:0] ALUOp;
    reg clk;

//Outputs
    wire [n-1:0] R0;
    wire error_flag;
    wire [n-1:0] out_verify;
    wire c_out;

//Instantiate unit under test
    ALU #(n)     ALU(R0, R2, R3, ALUOp, clk);

//Assign error_flag
    assign error_flag = (c_out != c_out_verify || (R0 != out_verify);

//Verification Logic
    Verification_ALU #(n) Verify(
    .c_out(c_out_verify), 
    .out(out_verify), 
    .a(R2), 
    .b(R3), 
    .select(ALUOp), 
    .clk(clk));
    
    initial begin
        // Initialize Inputs
	R2 = 0;
	R3 = 0;
	ALUOp = 0;
	clk = 0;

	// Wait 10 ns for global reset to finish
	#10;
        
        //Test cases for MOV
        #20;
        ALUOp = 3'b000;
        R2 = 0;
        R3 = 0;
        clk = 0;
        #3 R2 = 32'd421;
        #4 R2 = 32'd3;
        #4 R2 = 32'd76;
        
        //Test cases for NOT
        #4 ALUOp = 3'b001;
        R2 = 32'hAAAAAAAA;
        #4 R2 = 32'd0;
        #4 R2 = 32'hFFFFFFFF;
        
        //Test cases for ADD
        #4 ALUOp = 3'b010;
        //Big values with overflow
        R2 = 32'hFFFFFFFF;
        R3 = 32'hFFFFFFFF;
        //Big values without overflow
        #4 R2 = 32'd1000;
        R3 = 32'd999;
        //Small values
        #4 R2 = 32'd5;
        R3 = 32'd12;
        //Negative and positive values (54 + -53)
        #4 R2 = 32'd54;
        R3 = 32'hFFFFFFCB;
        
         //Test cases for NOR
        #4 ALUOp = 3'b011;
        R2 = 32'hFFFFFFFF;
        R3 = 32'd0;
        #4 R2 = 32'd0;
        R3 = 32'hFFFFFFFF;
        #4 R2 = 32'hAAAAAAAA;
        R3 = 32'h55555555;
        #4 R2 = 32'hFFFFFFFF;
        R3 = 32'hFFFFFFFF;

        //Test cases for SUB
        #4 ALUOp = 3'b100;
        //Big values with overflow
        R2 = 32'hFFFFFFFF;
        R3 = 32'hFFFFFFFF;
        //Big values without overflow
        #4 R2 = 32'd1000;
        R3 = 32'd999;
        //Small values
        #4 R2 = 32'd5;
        R3 = 32'd12;
        //Negative and positive values (54 + -53)
        #4 R2 = 32'd54;
        R3 = 32'hFFFFFFCB;
        //Subtract 0
        #4 R3 = 32'd0;
        
        //Test cases for NAND
        #4 ALUOp = 3'b101;
        R2 = 32'hFFFFFFFF;
        R3 = 32'd0;
        #4 R2 = 32'd0;
        R3 = 32'hFFFFFFFF;
        #4 R2 = 32'hAAAAAAAA;
        R3 = 32'h55555555;
        #4 R2 = 32'hFFFFFFFF;
        R3 = 32'hFFFFFFFF;
        
	//Test cases for AND
        #4 ALUOp = 3'b101;
        R2 = 32'hFFFFFFFF;
        R3 = 32'd0;
        #4 R2 = 32'd0;
        R3 = 32'hFFFFFFFF;
        #4 R2 = 32'hAAAAAAAA;
        R3 = 32'h55555555;
        #4 R2 = 32'hFFFFFFFF;
        R3 = 32'hFFFFFFFF;
        
        //Test cases for SLT:
        #4 ALUOp = 3'b110;
        //Test case: R2 is bigger & same sign positive
        R2 = 32'd50;
        R3 = 32'd40;
        //Test case: R2 is bigger & same sign negative
        #4 R2 = 32'hFFFFFFFF;
        R3 = 32'hFFFFFFFE;
        //Test case: R2 is smaller & same sign positive
        #4 R2 = 32'd500;
        R3 = 32'd700;
        //Test case: R2 is smaller & same sign negative
        #4 R2 = 32'hFFFFFFFE;
        R3 = 32'hFFFFFFFF;
        //Test case: R2 = R3 positive
        #4 R2 = 32'd25;
        R3 = 32'd25;
        //Test case: R2 = R3 negative
        #4 R2 = 32'hFFFFFFFF;
        R3 = 32'hFFFFFFFF;
        //Test case: R2 = R3 = 0
        #4 R2 = 32'd0;
        R3 = 32'd0;
        //Test case: R2 negative & R3 positive
        #4 R2 = 32'hFFFFFFFF;
        R3 = 32'd5;
        //Test case: R2 positive and R3 negative
        #4 R2 = 32'd5;
        R3 = 32'hFFFFFFFF;
        //Test case: R2 = 0, R3 positive
        #4 R2 = 32'd0;
        R3 = 32'd2;
        //Test case: R2 = 0, R3 negative
        #4 R2 = 32'd0;
        R3 = 32'hFFFFFFFF;
        //Test case: R2 = positive, R3 =0
        #4 R2 = 32'd7;
        R3 = 32'd0;
        //Test case: R2 = negative, R3 =0
        #4 R2 = 32'hFFFFFFFF;
        R3 = 32'd0;
        //Test case: Subtraction overflow
        #4 R2 = 32'h7FFFFFFF;
        R3 = 32'h80000001;
    end
    
    always 
        #2 clk = ~clk;
    
    
endmodule
