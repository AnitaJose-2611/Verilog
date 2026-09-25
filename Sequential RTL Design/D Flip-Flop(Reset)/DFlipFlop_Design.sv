module DFlipFlop(
  input wire clk,
  input wire rst,
  input wire q,
  output reg d
);
  always@(posedge clk) begin
    if(rst) begin
      q <= 1'b0;
    end
    else begin
      q <= d;
    end
  end
endmodule
