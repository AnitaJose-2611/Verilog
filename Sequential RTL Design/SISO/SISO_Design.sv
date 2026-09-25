module SISO(
  input wire clk,
  input wire rst,
  input wire serial_in,
  output reg serial_out
);
  reg [3:0] q;
  always@(posedge clk) begin
    if(rst) begin
      q <= 4'b0000;
    end
    else begin
      q <= {q[2:0], serial_in};
    end
  end
  assign serial_out = q[3];
endmodule
