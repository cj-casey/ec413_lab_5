`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:02 02/28/2022 
// Design Name: 
// Module Name:    FA_str 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module FA_str(c_out, sum, a, b, c_in);

//parameter D = 0;		

input		a, b, c_in; //declare inputs a, b and c_in, 1 bit each
output	c_out, sum; //declare outputs c_out and sum, 1 bit each
//declare wires for values being passed between different gates
wire		not_a, not_b, not_c;
wire		and1_out, and2_out, and3_out, and4_out;
wire		and5_out, and6_out, and7_out, and8_out;

NOT	   not1		(not_a, a);
NOT	   not2		(not_b, b);
NOT		not3		(not_c, c_in);

// get sum
AND3			and1		(and1_out, a, not_b, not_c);
AND3			and2		(and2_out, not_a, b, not_c);
AND3			and3		(and3_out, not_a, not_b, c_in);
AND3			and4		(and4_out, a, b, c_in);
OR4				or1		(sum, and1_out, and2_out, and3_out, and4_out);

// get c_out							
AND2			and5		(and5_out, a, b);
AND2			and6		(and6_out, b, c_in);
AND2			and7		(and7_out, a, c_in);
AND3			and8		(and8_out, a, b, c_in);
OR4			or2		(c_out, and5_out, and6_out, and7_out, and8_out);


endmodule