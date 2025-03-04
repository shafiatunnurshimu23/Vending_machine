//-----------------------------------------------------------------------------
//
// Title       : alu_4bit
// Design      : DSD_Project
// Author      : ccc
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : C:/Users/ccc/Desktop/DSD_Project/DSD_Project/src/alu_4bit.v
// Generated   : Sun Jan 19 12:01:57 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps

module alu_4bit (
    input wire [3:0] a,     // Input A
    input wire [3:0] b,     // Input B
    input wire s0,          // Control Signal 0
    input wire s1,          // Control Signal 1
    input wire alu_en,      // ALU Enable Signal
    output wire [7:0] result // Output (8-bit for multiplication)
);

wire [3:0] add_out, sub_out;
wire [7:0] mul_out;
wire comp_result;
wire carry, borrow;

// Call Modules
parallel_adder add_module (a, b, 1'b0, add_out, carry);
parallel_subtractor sub_module (a, b, sub_out, borrow);
multiplier_4bit mul_module (a, b, mul_out);
comparator_4bit comp_module (a, b, comp_result);


wire [7:0] add_result, sub_result, mul_result, comp_result_expanded;
assign add_result = {4'b0000, add_out} & {8{~s0 & ~s1 & alu_en}}; // Addition (s0=0, s1=0)
assign sub_result = {4'b0000, sub_out} & {8{s0 & ~s1 & alu_en}};  // Subtraction (s0=1, s1=0)
assign mul_result = mul_out & {8{~s0 & s1 & alu_en}};            // Multiplication (s0=0, s1=1)
assign comp_result_expanded = {7'b0000000, comp_result} & {8{s0 & s1 & alu_en}}; // Comparator (s0=1, s1=1)

assign result = add_result | sub_result | mul_result | comp_result_expanded;

endmodule


