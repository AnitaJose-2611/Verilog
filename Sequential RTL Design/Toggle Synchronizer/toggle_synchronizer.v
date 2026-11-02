module toggle_synchronizer(
  input wire src_clk,
  input wire src_rst,
  input wire src_pulse,
  input  wire dst_clk,
  input wire dst_rst,
  output reg dst_pulse
);
  reg src_toggle;
  reg sync_ff1;
  reg sync_ff2;
  reg sync_ff2_d;

  //Source Domain
  always@(posedge src_clk or posedge src_rst) begin
    if(src_rst) 
      src_toggle <= 1'b0;
    else if(src_pulse)
      src_toggle <= ~src_toggle;
  end

  //Destination Domain
  always@(posedge dst_clk or posedge dst_rst) begin
    if(dst_rst) begin
      sync_ff1 <= 1'b0;
      sync_ff2 <= 1'b0;
      sync_ff2_d <= 1'b0;
      dst_pulse <= 1'b0;
    end
    else begin
      sync_ff1 <= src_toggle;
      sync_ff2 <= sync_ff1;
      sync_ff2_d <= sync_ff2;
      dst_pulse <= sync_ff2 ^ sync_ff2_d;
    end
  end
endmodule
