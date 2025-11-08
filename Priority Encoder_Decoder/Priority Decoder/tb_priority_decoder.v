`timescale 1ns / 1ps

module tb_priority_decoder;

    // Testbench variables (reg for inputs to the DUT, wire for outputs from the DUT)
    reg d3, d2, d1, d0;
    wire a, b, en;

    // Instantiate the Device Under Test (DUT)
    priority_decoder uut (
        .d3(d3), .d2(d2), .d1(d1), .d0(d0),
        .a(a), .b(b), .en(en)
    );

    // Setup display for results monitoring
    initial begin
        $display("Time | EN | a | b | d3 | d2 | d1 | d0 | Notes");
        $display("-----------------------------------------------------------------");
        // $monitor prints the signals whenever any of them change
        $monitor("%0t  | %b | %b | %b | %b  | %b  | %b  | %b  |",
                 $time, en, a, b, d3, d2, d1, d0);
    end

    initial begin
        // 1. Initial State: All inputs disabled (0000)
        {d3, d2, d1, d0} = 4'b0000;
        #10; // Wait 10ns
        
        // 2. Enable the decoder (en=1 for all cases below)
        
        // Case 1: Priority for d3=1 (Output: a=1, b=1)
        d3 = 1'b1; d2 = 1'b0; d1 = 1'b0; d0 = 1'b1; // d3 asserted, d0 also asserted (d3 wins)
        #10;
        
        // Case 2: Priority for d2=1 (Output: a=1, b=0)
        d3 = 1'b0; d2 = 1'b1; d1 = 1'b1; d0 = 1'b0; // d2 asserted, d1 also asserted (d2 wins)
        #10;
        
        // Case 3: Priority for d1=1 (Output: a=0, b=1)
        d3 = 1'b0; d2 = 1'b0; d1 = 1'b1; d0 = 1'b1; // d1 asserted, d0 also asserted (d1 wins)
        #10;
        
        // Case 4: Priority for d0=1 (Output: a=0, b=0) (Default when others are 0)
        d3 = 1'b0; d2 = 1'b0; d1 = 1'b0; d0 = 1'b1; 
        #10;
        
        // Case 5: All inputs disabled again (Output: a=0, b=0, en=0)
        {d3, d2, d1, d0} = 4'b0000;
        #10;
        
        $finish;
    end
    
    // Optional VCD dump code
    initial begin
        $dumpfile("priority_decoder.vcd");
        $dumpvars(0, tb_priority_decoder);
    end

endmodule