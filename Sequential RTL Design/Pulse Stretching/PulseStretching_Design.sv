module PulseStretcher #(
  parameter WIDTH = 3
)(
  input wire clk,
  input wire reset,
  input wire pulse_in,
  output wire pulse out
);
  reg[WIDTH-1:0] count;
  always_ff@(posedge clk) begin
    if(reset) begin
      count <= 3'b0;
      pulse_out <= 1'b0;
    end
    else if(pulse_in) begin
      count <= 3'd4;
      pulse_out <= 1'b1;
    end
    else if(count != 0) begin
      count <= count - 1'b1;
      pulse_out <= 1'b1;
    end
    else begin
      pulse_out <= 1'b0;
    end
  end
endmodule
      
