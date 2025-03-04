//-----------------------------------------------------------------------------
//
// Title       : comparator_4bit
// Design      : DSD_Project
// Author      : ccc
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : C:/Users/ccc/Desktop/DSD_Project/DSD_Project/src/comparator_4bit.v
// Generated   : Thu Jan 16 22:27:21 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps

//{{ Section below this comment is automatically maintained
//    and may be overwritten
//{module {comparator_4bit}}

module comparator_4bit (
    input wire [3:0] a,     // First number (A)
    input wire [3:0] b,     // Second number (B)
    output wire a_gte_b     // Output: 1 if A >= B, else 0
);

wire [3:0] diff;  // Difference result
wire bout;        // Borrow-out from subtraction

// Use the parallel subtractor to compute A - B
parallel_subtractor ps (a, b, diff, bout);

// If borrow-out (bout) is 0, then A >= B; otherwise, A < B
assign a_gte_b = bout;

endmodule

