 `timescale 1ns/1ps

module tb;
    reg A, B;
    wire SUM, CARRY;
  half_adder uut (
        .A(A),
        .B(B),
    .SUM(SUM),
    .CARRY(CARRY)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;

        $finish;
    end
endmodule