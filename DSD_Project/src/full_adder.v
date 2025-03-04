//-----------------------------------------------------------------------------
//
// Title       : full_adder
// Design      : DSD_Project
// Author      : ccc
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : C:/Users/ccc/Desktop/DSD_Project/DSD_Project/src/full_adder.v
// Generated   : Wed Jan 15 22:30:33 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps

module full_adder (
    input wire a,
    input wire b,
    input wire cin,
    output wire sum,
    output wire cout
);

wire s1, c1, c2;


half_adder h1 (a, b, s1, c1);
half_adder h2 (s1, cin, sum, c2);


assign cout = c1 | c2;

endmodule

