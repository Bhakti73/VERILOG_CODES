`timescale 1ns / 1ps

module mux_4to1 (
    // Data Inputs
    input I0,
    input I1,
    input I2,
    input I3,

    // Select Lines (S1 is MSB, S0 is LSB)
    input S1,
    input S0,

    // Output
    output Y
);

    // Dataflow Logic: Y = (S1)? [select I2/I3] : [select I0/I1];
    assign Y = S1 ? (S0 ? I3 : I2) : 
                      (S0 ? I1 : I0);

endmodule