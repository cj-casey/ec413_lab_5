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
    output cout
    );
    wire [SIZE-1:0] c;
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
endmodule
