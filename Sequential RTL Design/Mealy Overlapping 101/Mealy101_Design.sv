module mealy_101(
  input wire clk,
  input wire rst,
  input wire serial_in,
  output reg result
);
  typedef enum logic [1:0] {
    S0,
    S1,
    S2
  }state_t;

  state_t, state, next_state;

  always_ff@(posedge clk) begin
    if(reset)
      state <= S0;
    else
      state <= next_state;
  end

  always_comb begin
    next_state = state;
    output = 1'b0;
    case(state)
      S0: begin
        if(serial_in)
          next_state = S1;
      end
      S1: begin
        if(serial_in)
          next_state = S1;
      end
      S2: begin
        if(serial_in)
          next_state = S0;
      end
    endcase
  end
endmodule
      
        
