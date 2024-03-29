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


module OR4(
    output Z,  
    input A,
    input B,
    input C,
    input D
    );
    
    wire a1,a2,b1,b2,c1,c2;
    wire w1,w2,w3;
    
    nand u0(a1,A,A);
    nand u1(a2,B,B);
    nand u2(w1,a1,a2);
    
    nand u3(b1,w1,w1);
    nand u4(b2,C,C);
    nand u5(w2,b1,b2);
    
    nand u6(c1,w2,w2);
    nand u7(c2,D,D);
    nand u8(Z, c1,c2);
    
    
    
endmodule
