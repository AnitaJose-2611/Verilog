module DEMUX1to2(
  input i , s
  output y0 , y1
);
  assign y0 = i & ~s;
  assign y1 = i & s
endmodule
