//-----------------------------------------------------------------------------
//
// Title       : DFF
// Design      : DSD_Project
// Author      : ccc
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : C:/Users/ccc/Desktop/DSD_Project/DSD_Project/src/DFF.v
// Generated   : Wed Jan 15 22:33:01 2025
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
//{module {DFF}}

module DFF (
    input wire in,
    input wire Clk,
    input wire load,
    input wire En,
    input wire Clear,
    output reg out
);

always @(posedge Clk) begin
    if (Clear) begin
        out <= 0;
    end else if (En && load) begin
        out <= in;
    end else if (load && !En) begin
        out <= 1'bz; // High-impedance state
    end
end

endmodule
