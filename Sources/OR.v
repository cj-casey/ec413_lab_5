`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 06:45:45 PM
// Design Name: 
// Module Name: AND
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


module OR(
    input A,
    input B,
    output C
    );
    
    wire w1,w2;
    nand u0(A,A,w1);
    nand u1(B,B,w2);
    nand u2(w1,w2,C);
    
endmodule
