`timescale 1ns / 1ps

module gates(
input a,
input b,
output y
    );
    
    assign y=a|b;
    
endmodule