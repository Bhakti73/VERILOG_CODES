`timescale 1ns / 1ps

module SRlatch_NAND(
  input S, R,
  output Q, Qbar
);
  assign Q    = ~(S & Qbar);
  assign Qbar = ~(R & Q);
endmodule
