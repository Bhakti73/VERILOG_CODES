`timescale 1ns/1ps

module tb();

reg [7:0] in;
wire [2:0] out;

priority_encoder8to3 uut(in, out);

// waveform dump
initial begin
    $dumpfile("priority_encoder.vcd");
    $dumpvars(0, tb);
end

// stimulus
initial begin
    $monitor("t=%0t  in=%b  out=%b", $time, in, out);

    in = 8'b00000001; #10;    // only bit 0     → 000
    in = 8'b00001001; #10;    // bit 3 & 0      → 011 (3 has priority)
    in = 8'b00101000; #10;    // bit 5 & 3      → 101 (5 has priority)
    in = 8'b10000010; #10;    // bit 7 & 1      → 111 (7 has priority)
    in = 8'b00000000; #10;    // no input       → xxx

    $finish;
end

endmodule
