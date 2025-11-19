`timescale 1ns/1ps

module tb;

    reg D, CLK;
    wire Q;

    d_ff uut (
    .D(D),
        .CLK(CLK),
    .Q(Q)
    );

    // clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;   // 10ns clock period
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        $monitor("T=%0t | CLK=%b | D=%b | Q=%b",
               $time, CLK, D, Q);

    D = 0; #12;
        D = 1; #10;
        D = 0; #10;
        D = 1; #10;
        D = 0; #15;

        $finish;
    end

endmodule
