module cdc_source(
  input src_clk,
  input src_reset,
  input send,
  input [7:0] data_in,
  input ack_syn,
  output reg req,
  output reg [7:0] data_bus,
  output logic busy
);
  always@(posedge src_clk or posedge src_reset) begin
    if(src_reset) begin
      req <= 1'b0;
      data_bus <= 8'b0;
      busy <= 1'b0;
    end
    else begin
      if(send && !busy) begin
        data_bus <= data_in;
        reg <= 1'b1;
        busy <= 1'b1;
      end
      else if(ack_syn && req) begin
        req <= 1'b0;
      end
      else if(!ack_syn && !req && busy) begin
        busy <= 1'b0;
      end
    end
  end
endmodule
