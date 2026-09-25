module FrequencyDivider(
  input wire clk,
  input wire reset,
  output reg clk_out
);
  always_ff@(posedge clk) begin
    if(reset)
      clk_out <= 1'b0;
    else
      clk_ou <= ~clk;
  end
endmodule
