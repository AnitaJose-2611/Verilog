module RisingEdgeDetector(
  input logic clk,
  input logic rst,
  input logic signal_in,
  output logic rise_pulse
);
  logic signal_d;
  always_ff@(posedge clk) begin
    if(reset)
      signal_d <= 0;
    else
      signal_d <= signal_in;
  end
  assign rise_pulse = signal_in & ~signal_d;
endmodule
