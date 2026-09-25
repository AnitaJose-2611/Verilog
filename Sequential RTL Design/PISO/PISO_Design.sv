module PISO(
  input wire clk,
  input wire rst,
  input wire en,
  input wire load,
  input wire [3:0] parallel_in,
  output wire serial_out
);
  reg [3:0] q;
  always@(posedge clk) begin
    if(rst) begin
      q <= 4'b0000;
    end
    else if(load) begin
      q <= parallel_in;
    end
    else if(en) begin
      q <= {q[2:0], 1'b0};
    end
  end
  assign serial_out = q[3];
endmodule
