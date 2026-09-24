module RippleCarryAdder(
  input [3:0] a, b,
  output [3:0] s,
  output cout
);
  wire ci, w1, w2, w3;
  FullAdder u1(a[0], b[0], ci, s[0], w1);
  FullAdder u2(a[1], b[1], w1, s[1], w2);
  FullAdder u3(a[2], b[2], w2, s[2], w3);
  SullAdder u4(a[3], b[3], w3, s[3], cout);
endmodule
