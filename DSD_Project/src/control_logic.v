//-----------------------------------------------------------------------------
//
// Title       : control_logic
// Design      : project_module
// Author      : Asus
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : E:/4.2/DSD lab/Project/project_module/src/control_logic.v
// Generated   : Tue Jan 14 02:56:31 2025
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
//{module {control_logic}}

module control_logic (
	
	input clk,
	input reset,
	input C,
	output [2:0] Q,
	output [7:0] T,
	
	);
	
	wire [2:0] D;
	wire [2:0] Q_bar;
	
	//d_flip flop's input
	assign D[2] = (Q[1] & (Q[2] ^ Q[0]))| (Q[2] & ~Q[1]) ; 
	assign D[1] = Q[1] ^ Q[0];
	assign D[0] = ~Q[0] | (~Q[2] & Q[1] & Q[0] & C) ;
	
	// flip_flops output
	
	D_Flip_Flop D0 (
    .D(D[0]),
    .CLK(clk),
    .EN(1'b1),
    .CLR(reset),
    .L(1'b1),
    .Q(Q[0]),
    .Q_bar(Q_bar[0])
	);
	
	D_Flip_Flop D1 (
    .D(D[1]),
    .CLK(clk),
    .EN(1'b1),
    .CLR(reset),
    .L(1'b1),
    .Q(Q[1]),
    .Q_bar(Q_bar[1])
	);
	
	D_Flip_Flop D2 (
    .D(D[2]),
    .CLK(clk),
    .EN(1'b1),
    .CLR(reset),
    .L(1'b1),
    .Q(Q[2]),
    .Q_bar(Q_bar[2])
	);
	
	
	
	Decoder3to8 decoder(
	.address(Q),
	.row_select(T)
	);

//}} End of automatically maintained section

// Enter your statements here //

endmodule
