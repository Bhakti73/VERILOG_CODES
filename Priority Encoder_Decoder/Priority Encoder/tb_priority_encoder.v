`timescale 1ns / 1ps

module tb_priority_encoder();

    reg d3,d2,d1,d0;
    wire a,b,v; // a and b are the 2-bit encoded output, v is the valid signal

    priority_encoder uut(d3, d2, d1, d0, a, b, v);

    integer i;
    
    initial begin
        // Print a header for clarity
        $display("Time | d3 d2 d1 d0 | a b | v | Priority Encoder Output");


        for(i=0; i<16; i=i+1) begin
            // 1. Assign New Inputs
            {d3, d2, d1, d0} = i;
            
            // 2. Wait for the DUT to calculate the output
            #10;
            
            // 3. Display the results
            $display("%0t | %b %b %b %b | %b %b | %b | Input i = %0d", 
                      $time, d3, d2, d1, d0, a, b, v, i);
                      
            // Optional delay before next input assignment
            #10; 
        end
        
        $finish;
    end

endmodule