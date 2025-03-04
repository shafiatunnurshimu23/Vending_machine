//-----------------------------------------------------------------------------
//
// Title       : test_comparator_4bit
// Design      : DSD_Project
// Author      : ccc
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : C:/Users/ccc/Desktop/DSD_Project/DSD_Project/src/test_comparator_4bit.v
// Generated   : Thu Jan 16 22:28:11 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps

module test_comparator_4bit;

reg [3:0] a, b;          // Inputs: A and B
wire a_gte_b;            // Output: A >= B (1 or 0)

// Instantiate the 4-bit comparator
comparator_4bit uut (a, b, a_gte_b);

initial begin
    $monitor("Time=%0t | A = %b (%0d), B = %b (%0d) | A >= B = %b", 
              $time, a, a, b, b, a_gte_b);

    // Test case 1: A = 9, B = 5  (9 >= 5 ? True)
    a = 4'b1001; b = 4'b0101; #10;

    // Test case 2: A = 5, B = 9  (5 >= 9 ? False)
    a = 4'b0101; b = 4'b1001; #10;

    // Test case 3: A = 7, B = 7  (7 >= 7 ? True)
    a = 4'b0111; b = 4'b0111; #10;

    // Test case 4: A = 2, B = 3  (2 >= 3 ? False)
    a = 4'b0010; b = 4'b0011; #10;

    $stop; // End simulation
end

endmodule

