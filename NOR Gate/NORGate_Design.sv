module NORGate(
  input a , b,
  output out
);
  assign out = ~(a | b);
endmodule

