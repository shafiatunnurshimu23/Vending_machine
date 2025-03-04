

`timescale 1ps / 1ps

module con8to1 (
    input wire [7:0] data,   // 8-bit input
    output wire single_bit   // 1-bit output
);

    // Select the LSB (bit 0)
    assign single_bit = data[0];

endmodule
