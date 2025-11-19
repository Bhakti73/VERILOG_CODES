`timescale 1ns / 1ps

module tb_gates;

    reg a;        // input
    wire y;       // output

    // DUT (Device Under Test)
    gates uut (
        .a(a),
        .y(y)
    );

    initial begin
        // waveform
        $dumpfile("dump.vcd");
        $dumpvars(1, tb_gates);

        // monitor values
        $monitor("Time=%0t | a=%b | y=%b", $time, a, y);

        // test cases
        a = 0;    #10
        a = 1;    #10
        a = 0;    #10
        a = 1;    #10

        $finish;
    end

endmodule
