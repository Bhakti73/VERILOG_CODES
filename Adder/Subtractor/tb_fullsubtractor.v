`timescale 1ns/1ps

module tb;

    reg A, B, Bin;
    wire DIFF, BORROW;

    full_subtractor uut (
        .A(A),
        .B(B),
        .Bin(Bin),
        .DIFF(DIFF),
        .BORROW(BORROW)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        $monitor("Time=%0t | A=%b B=%b Bin=%b | DIFF=%b BORROW=%b",
                  $time, A, B, Bin, DIFF, BORROW);

        A=0; B=0; Bin=0; #10
        A=0; B=0; Bin=1; #10
        A=0; B=1; Bin=0; #10
        A=0; B=1; Bin=1; #10
        A=1; B=0; Bin=0; #10
        A=1; B=0; Bin=1; #10
        A=1; B=1; Bin=0; #10
        A=1; B=1; Bin=1; #10

        $finish;
    end

endmodule
