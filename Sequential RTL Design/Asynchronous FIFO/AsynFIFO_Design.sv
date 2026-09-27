module AsyncFIFO #(
  parameter ADDR_WIDTH = 8,
  parameter DATA_WIDTH = 3
)(
  input wire wr_clk,
  input wire rd_clk,
  input wire wr_rst,
  input wire rd_rst,
  input wire wr_en,
  input wire rd_en,
  input wire[DATA_WIDTH-1:0] wr_data,
  output wire[DATA_WIDTH-1:0] rd_data,
  output wire full,
  output wire empty
);
  parameter PTR_WIDTH = ADDR_WIDTH + 1;
  parameter DEPTH = 1 << ADDR_WIDTH;
  //FIFO Memory
  wire[DATA_WITH-1:0] mem[0:DEPTH-1];
  wire[PTR_WIDTH-1:0] wr_ptr_bin;
  wire[PTR_WIDTH-1:0] rd_ptr_bin;
  wire[PTR_WIDTH-1:0] wr_ptr_bin_nxt;
  wire[PTR_WIDTH-1:0] rd_ptr_bin_nxt;
  wire[PTR_WIDTH-1:0] wr_ptr_gray;
  wire[PTR_WIDTH-1:0] rd_ptr_gray;
  wire[PTR_WIDTH-1:0] wr_ptr_gray_nxt;
  wire[PTR_WIDTH-1:0] rd_ptr_gray_nxt;
  wire[PTR_WIDTH-1:0] wr_ptr_gray_syn1;
  wire[PTR_WIDTH-1:0] wr_ptr_gray_syn2;
  wire[PTR_WIDTH-1:0] rd_ptr_gray_sync1;
  wire[PTR_WIDTH-1:0] rd_ptr_gray_sync2;
  
  always_comb begin
    wr_ptr_bin_nxt = wr_ptr_bin
    if(wr_en && !full)
      wr_ptr_bin_nxt = wr_ptr_bin + 1'b1;
    wr_ptr_gray_nxt = (wr_ptr_gray_nxt >> 1) ^ wr_ptr_bin_nxt;
  end

  always_comb begin
    rd_ptr_bin_nxt = rd_ptr_bin;
    if(rd_en && !empty)
      rd_ptr_bin_next = rd_ptr_bin_next + 1'b1;
    rd_ptr_gray_nxt = (rd_ptr_gray_nxt >> 1) ^ rd_ptr_bin_nxt;
  end

  //Write Domain
  always_ff@(posedge wr_clk or posedge wr_rst) begin
    if(wr_rst) begin
      wr_ptr_bin <= '0;
      wr_ptr_gray <= '0;
      full <= 1'b0;
    end
    else begin
      if(wr_en && !full) begin
        mem[wr_ptr_bin[ADDR_WIDTH-1:0]] <= wr_data;
        wr_ptr_bin <= wr_ptr_bin_nxt;
        wr_ptr_gray <= wr_ptr_gray_nxt;
        full <= (wr_ptr_gray_next =={~rd_ptr_gray_sync2[PTR_WIDTH-1:PTR_WIDTH-2], rd_ptr_gray_sync2[PTR_WIDTH-3:0]});
      end
    end
  end
  always_ff@(posedge wr_clk or posedge wr_rst) begin
    if(rd_rst) begin
      rd_ptr_bin <= '0;
      rd_ptr_gray <= '0;
      empty <= 1'b0;
    end
    else begin
      if(rd_en && !empty) begin
        rd_data <= mem[rd_ptr_bin[ADDR_WIDTH-1:0]];
        rd_ptr_bin <= rd_ptr_bin_nxt;
        rd_ptr_gray <= rd_ptr_gray_nxt;
        empty <= (rd_ptr_gray_next == wr_ptr_gray_sync2);
      end
    end
  end
  always_ff @(posedge wr_clk or posedge wr_reset) begin
    if (wr_reset) begin
      rd_ptr_gray_sync1 <= '0;
      rd_ptr_gray_sync2 <= '0;
    end
    else begin
      rd_ptr_gray_sync1 <= rd_ptr_gray;
      rd_ptr_gray_sync2 <= rd_ptr_gray_sync1;
    end
  end
  always_ff @(posedge rd_clk or posedge rd_reset) begin
    if (rd_reset) begin
      wr_ptr_gray_sync1 <= '0;
      wr_ptr_gray_sync2 <= '0;
    end
    else begin
      wr_ptr_gray_sync1 <= wr_ptr_gray;
      wr_ptr_gray_sync2 <= wr_ptr_gray_sync1;
    end
  end
endmodule
