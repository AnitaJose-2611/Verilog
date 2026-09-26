module syncFIFO #(
  parameter DATA_WIDTH = 8,
  parameter DEPTH = 4
)(
  input wire clk,
  input wire reset,
  input wire wr_en,
  input wire rd_en,
  input wire [DATA_WIDTH-1:0] data_in,
  output reg [DATA_WIDTH-1:0] data_out,
  output wire full,
  output wire empty
);
  reg [DATA_WIDTH-1:0] mem[0:DEPTH-1];
  reg [$clog2(DEPTH)-1:0] wr_pt;
  reg [$clog2(DEPTH)-1:0] rd_ptr;
  reg [$clog2(DEPTH+1)-1:0] count;

  assign empty = (count == 0);
  assign full = (count == DEPTH);

  always_ff@(posedge clk) begin
    if(reset) begin
      wr_ptr <= '0;
      rd_ptr <= '0;
      count <= '0;
      data_out <= '0;
    end
    else begin
      if(wr_en && !full) begin
        mem[wr_ptr] <= data_in;
        wr_ptr <= wr_ptr + 1'b1;
      end
      if(rd_en && !empty) begin
        data_out <= mem[rd_ptr];
        rd_ptr <= rd_ptr + 1'b1;
      end
      case({wr_en && !full, rd_en && !empty})
        2'b01: begin
          count <= count - 1'b1;
        end
        2'b10: begin
          count <= count + 1'b1;
        end
        default: begin
          count <= count;
        end
      endcase
    end
  end
endmodule
