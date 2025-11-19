`timescale 1ns/1ps

module tb();

reg clk, reset;
wire [2:0] count;

counter uut(clk, reset, count);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Dumpfile for waveform diagram
initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0, tb);
end

// Stimulus
initial begin
    $monitor("time=%0t  reset=%b  count=%b", $time, reset, count);

    reset = 1;
    #12;
    reset = 0;

    #150;

    $finish;
end

endmodule
