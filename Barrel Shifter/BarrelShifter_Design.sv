module BarrelShifter(
  input logic [7:0] data,
  input logic [2:0] shift,
  output logic [7:0] result
);
  always_comb begin
    result = data >> shift;
  end
endmodule
