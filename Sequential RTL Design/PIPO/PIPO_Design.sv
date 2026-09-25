module PIPO(
  input wire clk,
  input wire rst,
  input wire en,
  input wire [3:0] parallel_in,
  output wire [3:0] parallel_out
);
  reg [3:0] q;
  always@(posedge clk) begin
    if(rst) begin
      q <= 4'b0000;
    end
    else if(en) begin
      q <= parallel_in;
    end
  end
  assign parallel_out = q;
endmodule
