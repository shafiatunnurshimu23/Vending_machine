`timescale 1ns / 1ps

module Decoder3to8 (
    input [2:0] address,
    output [7:0] row_select
);

   
    wire a0_not, a1_not, a2_not;
    
    not (a0_not, address[0]);
    not (a1_not, address[1]);
    not (a2_not, address[2]);

    
    and (row_select[0], a2_not, a1_not, a0_not);
    and (row_select[1], a2_not, a1_not, address[0]);
    and (row_select[2], a2_not, address[1], a0_not);
    and (row_select[3], a2_not, address[1], address[0]);
    and (row_select[4], address[2], a1_not, a0_not);
    and (row_select[5], address[2], a1_not, address[0]);
    and (row_select[6], address[2], address[1], a0_not);
    and (row_select[7], address[2], address[1], address[0]);

endmodule