module Mod6Counter(
  input wire clk,
  input wire rst,
  input wire en,
  output reg [2:0] count
);
  always@(posedge clk) begin
    if(reset) begin
      count <= 3'd0;
    end
    else if(en) begin
      if(count == 3'd5) begin
        count <= 3'd0;
      end
      else begin
        count <= count + 1'b1;
      end
    end
  end
endmodule
        
