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

module adder;
//Inputs
    parameter n = 32;
    reg [n-1:0] A;
    reg [n-1:0] B;
    reg cin;
//Outputs
    wire [n-1:0] SUM;
    wire error_flag;
    wire [n-1:0] out_verify;
    wire cout_verify;
    wire cout;
    wire ZERO;
    wire OVERFLOW;
//Instantiate unit under test
    adder_p #(.SIZE(n))ADDER(.A(A),.B(B),.cin(cin),.SUM(SUM),.cout(cout),.ZERO_FLAG(ZERO),.OVERFLOW_FLAG(OVERFLOW));

//Assign error_flag
    assign error_flag = (cout != cout_verify) || (SUM != out_verify);

//Verification Logic
    adder_verify #(n) VERIFY(A,B,cin,out_verify,cout_verify);
    
    initial begin
        // Initialize Inputs
	A = 32'd3;
	B = 32'd7;
	cin = 1;
	#100
	A = 32'd1;
	B = 32'd2;
	cin = 0;
	#100
	A = 32'd130000;
	B = 32'd23000;
	cin = 0;
	#100
	cin = 1;
	#100
	A = 32'd140000;
	B = 32'd220000;
	cin = 0;
	#100
	cin = 1;
	#100
	A = 32'd3000000000;
	B = 32'd1000000000;
	cin = 0;
	#100
	A = 32'd3000000000;
	B = 32'd1294967295;
	cin = 1;

	// Wait 10 ns for global reset to finish
	#100;
	A = 32'd2147483647;
	B = 32'd1;
	cin = 0;
        
        //Test cases for MOV
        
    end
    
endmodule
