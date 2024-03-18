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
    generate 
    genvar i;
         for(i = 0; i < SIZE;i = i+1) begin : gen_fa
             if(i == 0) begin
             FA_str u0(A[i*4+:4],B[i*4+:4],cin,SUM[i*4+:4],c[i]);
             end
             else if(i == 7) begin
             FA_str u1(A[i*4+:4],B[i*4+:4],c[6],SUM[i*4+:4],cout);
             end
             else
             begin
             FA_str u2(A[i*4+:4],B[i*4+:4],c[i-1],SUM[i*4+:4],c[i]);
             end
             end
    endgenerate
endmodule
