`timescale 1ns / 1ps

module tb_gates;
  reg a, b;
  wire y;

  // Instantiate design module
  gates uut (a, b, y);

  initial begin
    // Generate waveform file
    $dumpfile("dump.vcd");
    $dumpvars(1, tb_gates);

    // Monitor output
    $monitor("Time=%0t | a=%b | b=%b | y=%b", $time, a, b, y);

    // Test cases
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    $finish;
  end
endmodule
