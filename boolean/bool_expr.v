`timescale 1ns / 1ps

module bool_expr(
    input a, b, c, d,
    output y
);

    assign y = (a & b) | ((~c) & d);

endmodule
