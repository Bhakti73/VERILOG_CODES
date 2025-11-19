module seq_counter(
    input clk,
    input reset,
    output reg [2:0] out
);

always @(posedge clk or posedge reset) begin
    if (reset)
        out <= 3'b000;       // start at 0
    else begin
        case(out)
            3'b000: out <= 3'b011;   // 0  → 3
            3'b011: out <= 3'b101;   // 3  → 5
            3'b101: out <= 3'b110;   // 5  → 6
            3'b110: out <= 3'b000;   // 6  → 0
            default: out <= 3'b000;  // any other → 0
        endcase
    end
end

endmodule
