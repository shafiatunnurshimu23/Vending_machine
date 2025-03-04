`timescale 1ps / 1ps

module multiplier_4bit (
    input wire [3:0] a,       // 4-bit multiplicand
    input wire [3:0] b,       // 4-bit multiplier
    output wire [7:0] product // 8-bit product
);

wire [3:0] pp0, pp1, pp2, pp3; 
wire [7:0] sum1, sum2, sum3;  
wire c1, c2, c3;


assign pp0 = a & {4{b[0]}}; // Partial product for b[0]
assign pp1 = a & {4{b[1]}}; // Partial product for b[1], shifted by 1
assign pp2 = a & {4{b[2]}}; // Partial product for b[2], shifted by 2
assign pp3 = a & {4{b[3]}}; // Partial product for b[3], shifted by 3


// Add pp0 and shifted pp1
parallel_adder adder1 (pp0, {pp1[3:0], 1'b0}, 1'b0, sum1[3:0], c1);
assign sum1[7:4] = {3'b000, c1};

// Add sum1 and shifted pp2
parallel_adder adder2 (sum1[3:0], {pp2[3:0], 2'b00}, 1'b0, sum2[3:0], c2);
assign sum2[7:4] = {3'b000, c2};

// Add sum2 and shifted pp3
parallel_adder adder3 (sum2[3:0], {pp3[3:0], 3'b000}, 1'b0, product[3:0], c3);
assign product[7:4] = {3'b000, c3};

endmodule
