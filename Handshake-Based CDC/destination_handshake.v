module cdc_destination(
  input dst_clk,
  input dst_rst,
  input req_syn,
  input logic [7:0] data_bus,
  output reg ack,
  output logic [7:0] data_out,
  output logic data_valid
);
  always@(posedge dst_clk or posedge dst_rst) begin
    if(dst_rst) begin
      ack <= 1'b0;
      data_out <= 8'b0;
      data_valid <= 1'b0;
    end
    else begin
      data_valid <= 1'b0;
      if(req_syn && ~ack) begin
        data_out <= data_bus;
        data_valid <= 1'b1;
        ack <= 1'b1;
      end
      else if(!req_syn) begin
        ack <= 1'b0;
      end
    end
  end
endmodule
      
