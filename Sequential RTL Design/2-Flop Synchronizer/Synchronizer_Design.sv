module Synchronizer(
  input wire clk_dst,
  input wire rst_dst,
  input wire sync_signal,
  output wire async_signal
);
  reg sync_ff1;
  reg sync_ff2;
  always@(posedge clk_dst or posedge rst_dst) begin
    if(rst_dst) begin
      sync_ff1 <= 1'b0;
      sync_ff2 <= 1'b0;
    end
    else begin
      sync_ff1 <= async_signal;
      sync_ff2 <= sync_ff1;
    end
  end
  assign sync_signal = sync_ff2;
endmodule
    
