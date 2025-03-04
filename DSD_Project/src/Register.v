//-----------------------------------------------------------------------------
//
// Title       : Register
// Design      : DSD_Project
// Author      : shimu
// Company     : hp
//
//-----------------------------------------------------------------------------
//
// File        : C:/Users/HP/Downloads/DSD_Project/DSD_Project/DSD_Project/src/Register.v
// Generated   : Mon Jan 20 00:24:46 2025
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
//{module {Register}}

module Register (
    input [3:0] in,
    input i_en, // active low
    input clr,
    input clk,
    output [3:0] out
);
    // Internal signals for unused Q_bar outputs
    wire Q_bar_0, Q_bar_1, Q_bar_2, Q_bar_3;

    // Instantiating 4 D Flip-Flops
    D_Flip_Flop ff1 (
        .D(in[0]),
        .CLK(clk),
        .EN(i_en),
        .CLR(clr),
        .L(1'b1), // Load enable is always high
        .Q(out[0]),
        .Q_bar(Q_bar_0)
    );

    D_Flip_Flop ff2 (
        .D(in[1]),
        .CLK(clk),
        .EN(i_en),
        .CLR(clr),
        .L(1'b1), // Load enable is always high
        .Q(out[1]),
        .Q_bar(Q_bar_1)
    );

    D_Flip_Flop ff3 (
        .D(in[2]),
        .CLK(clk),
        .EN(i_en),
        .CLR(clr),
        .L(1'b1), // Load enable is always high
        .Q(out[2]),
        .Q_bar(Q_bar_2)
    );

    D_Flip_Flop ff4 (
        .D(in[3]),
        .CLK(clk),
        .EN(i_en),
        .CLR(clr),
        .L(1'b1), // Load enable is always high
        .Q(out[3]),
        .Q_bar(Q_bar_3)
    );

endmodule

