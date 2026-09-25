module UniversalShiftRegister(
  input wire clk,
  input wire rst,
  input wire en,
  input wire [1:0] sel
  input wire serial_left,
  input wire serial_right,
  input wire parallel_data
);
  reg q <= 4'b0000;
  always@(posedge clj) begin
    if(rst) begin
      q <= 4'b0000;
    end
    else if(en) begin
      case(sel)
        2'b00: q <= q;
        2'b01: q <= {serial_right, q[3:1]};
        2'b10: q <= {q[2:0], serial_left};
        2'b11: q <= parallel_data;
      endcase
    end
  end
endmodule
        
