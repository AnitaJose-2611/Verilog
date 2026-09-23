module CarrySelectAdder(
  input [3:0] A,
  input [3:0] B,
  input cin,
  output reg [3:0] sum,
  output reg cout
);
  wire [3:0] result0;
  wire [3:0] result1;
  assign result0 = {1'b0, a} + {1'b0, b} + 5'b0;
  assign result1 = {1'b0, a} + {1'b0, b} + 5'b1;
  assign {cout, sum} = cin? result1 : result0;
endmodule
