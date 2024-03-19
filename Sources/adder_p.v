`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 06:25:33 PM
// Design Name: 
// Module Name: adder_p
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


module adder_p #(parameter SIZE = 32) (
    input [SIZE-1:0] A,
    input [SIZE-1:0] B,
    input cin,
    output [SIZE-1:0] SUM,
    output cout,
    output ZERO_FLAG,
    output OVERFLOW_FLAG
    );
    wire [SIZE-1:0] c;
    wire overflow1,overflow2;
    //c_out, sum, a, b, c_in
    generate 
    genvar i;
         for(i = 0; i < SIZE;i = i+1) begin
             if(i == 0) begin
             FA_str u0(.c_out(c[i]), .sum(SUM[i]), .a(A[i]), .b(B[i]), .c_in(cin));
             end
             else if(i == SIZE-1) begin
             FA_str u1(.c_out(cout), .sum(SUM[i]), .a(A[i]), .b(B[i]), .c_in(c[i-1]));
             end
             else
             begin
             FA_str u2(.c_out(c[i]), .sum(SUM[i]), .a(A[i]), .b(B[i]), .c_in(c[i-1]));
             end
             end
    endgenerate
    
    assign ZERO_FLAG = (SUM == 0) ? 1'b1:1'b0;
   

    AND3 a0(overflow1,A[SIZE-1],B[SIZE-1],~SUM[SIZE-1]); 
    AND3 a1(overflow2,~A[SIZE-1],~B[SIZE-1],SUM[SIZE-1]);
    assign OVERFLOW_FLAG = overflow1 || overflow2;
    
endmodule
