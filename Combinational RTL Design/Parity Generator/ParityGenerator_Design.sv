module ParityGenerator #(
  parameter WIDTH = 8
)(
  input logic [WIDTH-1:0] data,
  output logic even_parity,
  output logic odd_parity
);
  assign even_parity = ^data;
  assign odd_parity = ~(^data);
endmodule
