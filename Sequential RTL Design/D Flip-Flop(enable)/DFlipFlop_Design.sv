module DFlipFlop(
  input wire clk,
  input wire en,
  input wire d,
  output reg q
);
  always@(posedge clk) begin
    if(en) begin
      q <= d;
    end
  end
endmodule
