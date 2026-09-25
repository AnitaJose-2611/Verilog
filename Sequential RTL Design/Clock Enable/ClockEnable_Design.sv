module ClockEnable(
  input wire clk,
  input wire reset,
  input wire [3:0] count;
  input wire en
);
  always_ff@(posedge clk) begin
    if(reset) begin
      count <= 4'b0000;
      en <= 1'b0;
    end
    else if(count == 4'd9) begin
      count <= 4'b0000;
      en <= 1'b1;
    end
    else begin
      count <= count + 1'b1;
      en <= 1'b0;
    end
  end
endmodule
  
