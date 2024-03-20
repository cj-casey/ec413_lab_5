`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 09:09:14 PM
// Design Name: 
// Module Name: subtractor_p
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


module subtractor_p #(parameter SIZE = 32) (
    input [SIZE-1:0] A,
    input [SIZE-1:0] B,
    input cin,
    output [SIZE-1:0] SUM,
    output cout,
    output ZERO_FLAG,
    output OVERFLOW_FLAG
    );
    
    wire throw_cout_away;
    
    adder_p #(SIZE) a0(A,~B+1,cin,SUM,throw_cout_away,ZERO_FLAG,OVERFLOW_FLAG);
    
    assign cout = 0;
    
endmodule

