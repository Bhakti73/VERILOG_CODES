`timescale 1ns / 1ps

module tb_mux_4to1;

    // Testbench signals
    reg I0, I1, I2, I3;  // Inputs to DUT are 'reg'
    reg S1, S0;          // Select lines are 'reg'
    wire Y;              // Output from DUT is 'wire'

    // Instantiate the Unit Under Test (UUT)
    mux_4to1 uut (
        .I0(I0), .I1(I1), .I2(I2), .I3(I3),
        .S1(S1), .S0(S0), .Y(Y)
    );

    integer i;

    // Setup display for results monitoring
    initial begin
        $display("-------------------------------------------------");
        $display("Time | S1 S0 | I3 I2 I1 I0 | Y_out | Notes");
        $display("-------------------------------------------------");
        // Monitor signals and print when they change
        $monitor("%0t | %b  %b  | %b  %b  %b  %b |  %b  |", 
                 $time, S1, S0, I3, I2, I1, I0, Y);
    end

    // Stimulus generation
    initial begin
        // Set unique inputs: I3=1, I2=0, I1=1, I0=0
        {I3, I2, I1, I0} = 4'b1010;
        
        // Loop through all 4 select combinations (S = 00, 01, 10, 11)
        for(i = 0; i < 4; i = i + 1) begin
            {S1, S0} = i;
            #10; // Wait 10ns for the MUX to respond
        end
        
        // Additional Test Case: Show output follows the selected input (I2)
        {S1, S0} = 2'b10; // Select I2 (I2 is currently '0')
        #10;
        
        I2 = 1'b1; // Change I2 to '1', Y should follow
        #10;
        
        I0 = 1'b1; // Change unselected input I0, Y should NOT change
        #10;
        
        $finish;
    end

endmodule