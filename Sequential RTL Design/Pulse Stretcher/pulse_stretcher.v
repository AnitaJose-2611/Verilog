module pulse_stretcher #(
  parameter STRETCH_CYCLES = 5
)(
  input wire clk,
  input wire rst,
  input wire pulse_in,
  output wire pulse_out
);
  reg [7:0] count;
  always@(posedge clk or posedge rst) begin
    if(rst) begin
      pulse_out <= 1'b0;
      count <= 8'b0;
    end
    else begin
      if(pulse_in) begin
        count <= STRETCH_CYCLES - 1;
        pulse_out <= 1'b1;
      end
      else if(count > 0) begin
        count <= count - 1'b1;
        pulse_out <= 1'b1;
      end
      else begin
        pulse_out <= 1'b0;
      end
    end
  end
endmodule
