module test_parallel_subtractor;

reg [3:0] a, b;            // Inputs: Minuend and Subtrahend
wire [3:0] diff;           // Output: Difference
wire bout;                 // Output: Borrow-out

// Instantiate the 4-bit parallel subtractor
parallel_subtractor uut (a, b, diff, bout);

initial begin
    $monitor("Time=%0t | A = %b (%0d), B = %b (%0d) | Diff = %b (%0d) | Borrow = %b", 
              $time, a, a, b, b, diff, diff, bout);

    // Test case 1: 9 - 5 = 4
    a = 4'b1001; b = 4'b0101; #10;

    // Test case 2: 7 - 3 = 4
    a = 4'b0111; b = 4'b0011; #10;

    // Test case 3: 15 - 9 = 6
    a = 4'b1111; b = 4'b1001; #10;

    // Test case 4: 3 - 7 (Should result in borrow)
    a = 4'b0011; b = 4'b0111; #10;

    $stop; // End simulation
end

endmodule
