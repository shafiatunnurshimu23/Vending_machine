module test_alu_4bit;

reg [3:0] a, b;   // Inputs
reg s0, s1;       // Control Signals
reg alu_en;       // ALU Enable Signal
wire [7:0] result; // Output (8-bit to support multiplication)

// Instantiate the ALU
alu_4bit uut (a, b, s0, s1, alu_en, result);

initial begin
    $monitor("Time=%0t | A=%b (%0d), B=%b (%0d), s0=%b, s1=%b, alu_en=%b | Result=%b (%0d)", 
             $time, a, a, b, b, s0, s1, alu_en, result, result);

    // Enable ALU
    alu_en = 1;

    // Test Case 1: Addition (A + B) -> s0=0, s1=0
    a = 4'b1001;  // 9
    b = 4'b0101;  // 5
    s0 = 0; s1 = 0; 
    #10; // Expected Result: 9 + 5 = 14 (00001110)

    // Test Case 2: Subtraction (A - B) -> s0=1, s1=0
    a = 4'b0110;  // 6
    b = 4'b0011;  // 3
    s0 = 1; s1 = 0; 
    #10; // Expected Result: 6 - 3 = 3 (00000011)

    // Test Case 3: Multiplication (A * B) -> s0=0, s1=1
    a = 4'b0011;  // 3
    b = 4'b0011;  // 3
    s0 = 0; s1 = 1; 
    #10; // Expected Result: 3 * 3 = 9 (00001001)

    // Test Case 4: Comparator (A >= B) -> s0=1, s1=1
    a = 4'b0101;  // 5
    b = 4'b0110;  // 6
    s0 = 1; s1 = 1; 
    #10; // Expected Result: (5 >= 6) -> 0 (00000000)

    // Test Case 5: Comparator (A >= B) -> A is greater
    a = 4'b0110;  // 6
    b = 4'b0011;  // 3
    s0 = 1; s1 = 1; 
    #10; // Expected Result: (6 >= 3) -> 1 (00000001)

    // Disable ALU and test behavior
    alu_en = 0;
    a = 4'b1111;  // 15
    b = 4'b0001;  // 1
    s0 = 0; s1 = 0;
    #10; // Expected Result: 0 (Disabled)

    $stop; // Stop Simulation
end

endmodule
