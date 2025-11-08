`timescale 1ns / 1ps

module priority_encoder(
input d3,d2,d1,d0,
output reg a,b,v
    );
    
    always @(*) begin
     a=0;
     b=0;
     v=0;
    
     if(d3==1) begin
      a=1;b=1;v=1;
     end
     else if(d2==1) begin
      a=1;b=0;v=1;
     end
     else if(d1==1) begin
      a=0;b=1;v=1;
     end
     else if(d0==1) begin
      a=0;b=0;v=1;
     end
    end
    
endmodule