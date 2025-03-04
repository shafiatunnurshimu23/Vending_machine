//-----------------------------------------------------------------------------
//
// Title       : parallel_subtractor
// Design      : DSD_Project
// Author      : ccc
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : C:/Users/ccc/Desktop/DSD_Project/DSD_Project/src/parallel_subtractor.v
// Generated   : Wed Jan 15 23:09:14 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps

module parallel_subtractor (
    input wire [3:0] a,     // Minuend (A)
    input wire [3:0] b,     // Subtrahend (B)
    output wire [3:0] diff, // Difference (A - B)
    output wire bout        // Borrow-out
);

wire [3:0] b_complement;   // 1's complement of B
wire c1, c2, c3;           // Intermediate carry signals


assign b_complement = ~b; 
assign c1 = 0'b1;


full_adder fa0 (a[0], b_complement[0], 1'b1, diff[0], c1); // LSB
full_adder fa1 (a[1], b_complement[1], c1, diff[1], c2);
full_adder fa2 (a[2], b_complement[2], c2, diff[2], c3);
full_adder fa3 (a[3], b_complement[3], c3, diff[3], bout); // MSB

endmodule

