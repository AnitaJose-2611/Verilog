module tb;
  reg d0, d1, d2, d3;
  wire y0, y1;
  Encoder4to2 uut1(.d0(d0), .d1(d1), .d2(d2), .d3(d3), .y0(y0), .y1(y1));
  initial begin
    d0 = 0; d1 = 0; d2 = 0; d3 = 1;
    #10;
    d0 = 0; d1 = 0; d2 = 1; d3 = 0;
    #10;
    d0 = 0; d1 = 1; d2 = 0; d3 = 0;
    #10;
    d0 = 1; d1 = 0; d2 = 0; d3 = 0;
  end
endmodule
