module UpDownCounter(
  input wire clk,
  input wire rst,
  input wire en,
  input wire up_down,
  output reg [3:0] count
);
  always@(posedge clk) begin
    if(en)begin
      if(up_down) begin
        count <= count + 1'b1;
      end
      else begin
        count <= count - 1'b1;
      end
    end
  end
endmodule
