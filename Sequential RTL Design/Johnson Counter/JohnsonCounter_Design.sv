module JohnsonCounter(
  input wire clk,
  input wire reset,
  input wire[3:0] data_in,
  output reg [3:0] data_out
);
  always_ff@(posedge clk) begin
    if(reset)
      data_out <= 4'b0000;
    else
      data_out <= {data_out[2:0], ~data_out[3]};
  end
endmodule
