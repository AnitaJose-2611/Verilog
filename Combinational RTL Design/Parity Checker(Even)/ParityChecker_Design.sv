module Parity_Checker(
  parameter WIDTH = 8
)(
  input logic[WIDTH-1:0] received_data;
  output logic parity_error
);
  assign parity_error = ^received_data;
endmodule
