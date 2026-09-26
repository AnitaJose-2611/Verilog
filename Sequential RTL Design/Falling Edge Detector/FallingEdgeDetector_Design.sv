module FallingEdgeDetector(
  input wire clk,
  input wire rst,
  input wire signal_in,
  output wire fall_signal
);
  wire signal_d;
  always_ff@(posedge clk) begin
    if(reset) begin
      signal_in <= 4'b0000;
    end
    else begin
      signal_in <= signal_d;
    end
  end
  assign fall_signal = ~signal_in & signal_d;
endmodule
