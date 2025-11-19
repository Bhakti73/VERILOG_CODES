module counter(
    input clk,
    input reset,
    output reg [2:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset)
        count <= 3'b000;        // Reset counter
    else
        count <= count + 1;     // Simple increment
end

endmodule
