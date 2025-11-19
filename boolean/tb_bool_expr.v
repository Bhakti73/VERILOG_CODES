`timescale 1ns/1ps

module tb;

    reg a, b, c, d;
    wire y;

    bool_expr uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .y(y)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        $monitor("Time=%0t | a=%b b=%b c=%b d=%b | y=%b",
                 $time, a, b, c, d, y);

        a=0; b=0; c=0; d=0; #10
        a=0; b=1; c=1; d=0; #10
        a=1; b=1; c=0; d=1; #10
        a=1; b=0; c=1; d=1; #10
        a=1; b=1; c=1; d=0; #10
        a=0; b=0; c=1; d=1; #10

        $finish;
    end

endmodule
