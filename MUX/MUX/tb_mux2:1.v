`timescale 1ns / 1ps

module tb_mux();

reg a,b,sel;
wire y;

// Instantiate the Unit Under Test (UUT)
mux uut(a,b,sel,y);

initial begin
    
    $display("Time | a | b | sel | y (a=0/sel=0:b=1)");
    $monitor("%4d | %b | %b | %b | %b", $time, a, b, sel, y);

    // Test Case 1: sel=0 (y should follow a)
    a=0;b=0;sel=0;
    #10
    a=0;b=1;sel=0;
    #10
    a=1;b=0;sel=0;
    #10
    a=1;b=1;sel=0;
    #10

    // Test Case 2: sel=1 (y should follow b)
    a=0;b=0;sel=1;
    #10
    a=0;b=1;sel=1;
    #10
    a=1;b=0;sel=1;
    #10
    a=1;b=1;sel=1;
    #10

    $finish;
end

endmodule