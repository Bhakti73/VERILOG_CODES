`timescale 1ns / 1ps


module tb_SRlatch_NAND;
  reg S, R;
  wire Q, Qbar;


  SRlatch_NAND uut (S, R, Q, Qbar);

  initial begin
 
    $dumpfile("dump.vcd");
    $dumpvars(1, tb_SRlatch_NAND);

  
    $monitor("Time=%0t | S=%b | R=%b | Q=%b | Qbar=%b", $time, S, R, Q, Qbar);


    S = 1; R = 1; #10;   // Hold state
    S = 0; R = 1; #10;   // Set
    S = 1; R = 1; #10;   // Hold
    S = 1; R = 0; #10;   // Reset
    S = 1; R = 1; #10;   // Hold
    S = 0; R = 0; #10;   // Invalid
    $finish;
  end
endmodule