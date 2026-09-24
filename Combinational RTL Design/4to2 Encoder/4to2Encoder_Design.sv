module Encoder4to2(
  input d0, d1, d2, d3,
  output y0, y1
);
  assign y0 = d1 | d3;
  assign y1 = d2 | d3
endmodule
