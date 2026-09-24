module HalfSubtractor(
  input a , b,
  output diff , b_out
);
  assign diff = a ^ b;
  assign b_out = (~a & b);
endmodule
