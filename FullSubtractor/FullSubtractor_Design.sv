module FullSubtractor(
  input a , b , b_in,
  output diff , b_out
);
  assign diff = a ^ b ^ b_in;
  assign b_out = (~a & b) | (~(a ^ b) & b_in);
endmodule 
