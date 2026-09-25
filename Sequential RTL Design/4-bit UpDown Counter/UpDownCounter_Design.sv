module UpDownCounter(
  input wire clk,
  input wire rst,
  input wire en,
  input wire up_down,
  output reg [3:0] count
);
  always@(posedge clk) begin
    if(rst) begin
      count <= 4'b0000;
    end
    else begin
      if(en) begin
        if(up_down) begin
          count <= count + 1'b1;
        end
        else begin
          count <= count - 1'b1;
        end
      end
    end
  end
endmodule
