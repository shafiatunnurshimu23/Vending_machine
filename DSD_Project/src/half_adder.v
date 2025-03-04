//-----------------------------------------------------------------------------
//
// Title       : half_adder
// Design      : DSD_Project
// Author      : ccc
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : C:/Users/ccc/Desktop/DSD_Project/DSD_Project/src/half_adder.v
// Generated   : Wed Jan 15 22:30:19 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps

module half_adder (
    input wire a,
    input wire b,
    output wire sum,
    output wire cout
);


assign sum = a ^ b;

assign cout = a & b;

endmodule

