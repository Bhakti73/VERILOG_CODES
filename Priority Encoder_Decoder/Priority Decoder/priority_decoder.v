`timescale 1ns / 1ps

module priority_decoder(
    // Inputs (driven by the testbench)
    input d3, d2, d1, d0,
    
    // Outputs (driven inside this module, must be 'reg')
    output reg a, b, en
);

    always @(*) begin
        // 1. Default Assignment (for the case d3=d2=d1=d0=0)
        // This prevents latches and acts as the case where no input is asserted.
        a = 1'b0;
        b = 1'b0;
        en = 1'b0; 

        // 2. Priority Logic (d3 > d2 > d1 > d0)
        
        // Highest Priority: d3 is active (Encoded output 11, Valid/Enable=1)
        if (d3) begin
            a = 1'b1;
            b = 1'b1;
            en = 1'b1;
        end 
        // Next Priority: d2 is active (Encoded output 10, Valid/Enable=1)
        else if (d2) begin
            a = 1'b1;
            b = 1'b0;
            en = 1'b1;
        end 
        // Next Priority: d1 is active (Encoded output 01, Valid/Enable=1)
        else if (d1) begin
            a = 1'b0;
            b = 1'b1;
            en = 1'b1;
        end 
        // Lowest Priority: d0 is active (Encoded output 00, Valid/Enable=1)
        else if (d0) begin
            a = 1'b0;
            b = 1'b0;
            en = 1'b1;
        end
        // If none are active, the output remains the default (a=0, b=0, en=0).
    end

endmodule