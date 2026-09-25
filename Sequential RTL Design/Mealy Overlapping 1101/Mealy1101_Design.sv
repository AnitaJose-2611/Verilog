module Mealy1101(
  input wire clk,
  input wire rst,
  input wire serial_in,
  output wire result
);
  typedef enum logic [1:0]{
    S0,
    S1,
    S2,
    S3
  }state_t;

  state_t, state, next_state;

  always_ff@(posedge clk) begin
    if(rst)
      state <= S0;
    else
      state <= next_state;
  end

  always_comb begin
    next_state = state;
    result = 1'b0;
    case(state)
      S0: begin
        if(serial_in)
          next_state = S1;
        else
          next_state = S0;
      end
      S1: begin
        if(serial_in)
          next_state = S2;
        else
          next_state = S0;
      end
      S2: begin
        if(serial_in)
          next_state = S2;
        else
          next_state = S3;
      end
      S3: begin
        if(serial_in)
          next_state = S1;
          result = 1'b1;
        else
          next_state = S0;
      end
    endcase
  end
endmodule
      
