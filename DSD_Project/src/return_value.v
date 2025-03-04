//-----------------------------------------------------------------------------
//
// Title       : return
// Design      : DSD_Project
// Author      : shimu
// Company     : hp
//
//-----------------------------------------------------------------------------
//
// File        : C:/Users/HP/Downloads/DSD_Project/DSD_Project/DSD_Project/src/return.v
// Generated   : Mon Jan 20 01:18:31 2025
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
//{module {return}}

module return_value (
	input [3:0] x,
	input en,
	output [3:0] y
	);
	
	assign y = x & {4{en}}; // Circuit implementation using bitwise AND

endmodule
