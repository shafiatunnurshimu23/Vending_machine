module test_multiplier_4bit;

reg [3:0] a, b;
wire [7:0] product;

multiplier_4bit uut (a, b, product);

initial begin
    $monitor("Time=%0t: a=%b, b=%b, product=%b", $time, a, b, product);

    a = 4'b0011; b = 4'b0101; #10; // Test case 1: 3 x 5 = 15
    a = 4'b0011; b = 4'b0011; #10; // Test case 2: 3 x 3 = 9
    a = 4'b0000; b = 4'b1010; #10; // Test case 3: 0 x 10 = 0
    a = 4'b0001; b = 4'b0011; #10; // Test case 4: 1 x 3 = 2
    $stop;
end

endmodule
