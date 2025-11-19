`timescale 1ns/1ps

module tb;
    reg J, K, CLK;
    wire Q;
    jk_ff uut (
        .J(J),
        .K(K),
        .CLK(CLK),
        .Q(Q)
    );

    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        $monitor("T=%0t | CLK=%b | J=%b | K=%b | Q=%b",
                 $time, CLK, J, K, Q);
        J = 0; K = 0; #12;   // no change
        J = 1; K = 0; #10;   // set
        J = 0; K = 1; #10; // reset
        J = 1; K = 1; #10;   // toggle
        J = 1; K = 1; #10;      // toggle again
        J = 0; K = 0; #10;   // hold

        $finish;
    end

endmodule
