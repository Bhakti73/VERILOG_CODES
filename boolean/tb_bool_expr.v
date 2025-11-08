`timescale 1ns / 1ps

module tb_bool_expr(

);
reg a,b,c,d;
wire y;

bool_expr uut(.a(a),.b(b),.c(c),.d(d),.y(y));

integer i;
initial begin
 
  for(i=0;i<16;i=i+1) begin
    // Assign 4-bit integer i to the 4 input registers {a,b,c,d}
    {a,b,c,d} = i;
    #10; 
    $display("%d | %b %b %b %b | %b", i, a, b, c, d, y); 
    #10;
  end
  
  $finish;
end
endmodule