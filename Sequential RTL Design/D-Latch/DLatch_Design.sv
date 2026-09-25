module DLatch(
  input wire en,
  input wire d,
  output reg q
);
  if(en) begin
    q <= d;
  end
endmodule
