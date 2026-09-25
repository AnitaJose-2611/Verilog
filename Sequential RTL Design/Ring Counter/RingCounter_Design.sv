module RingCounter(
  input clk,
  input reset,
  input [3:0] data_in,
  output reg data_out
);
  always_ff@(posedge clk) begin
    if(reset) begin
      data_out <= 4'b0000;
    end
    else begin
      data_out <= {data_out[2:0], data_out[3]};
    end
  end
endmodule
