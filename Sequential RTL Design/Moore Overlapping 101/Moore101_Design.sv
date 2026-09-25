module Moore101(
  input wire clk,
  input wire rst,
  input wire serial_in,
  output wire result
);
  typedef enum logic[1:0]{
    S0,
    S1,
    S2,
    S3
  }state_t;

  state_t, state, next_state;

  always_ff@(posedge clk) begin
    if(reset) 
      state <= S0;
    else
      state <= next_state;
  end

  assign result = (state == S3);

  always_comb begin
    next_state = state;
    case(state)
      S0: begin
        if(serial_in)
          next_state = S1;
      end
      S1: begin
        if(serial_in)
          next_state = S1;
        else
          next_state = S2;
      end
      S2: begin
        if(serial_in)
          next_state = S3;
        else
          next_state = S1;
      end
      S3: begin
        if(serial_in) 
          next_state = S0;
        else
          next_state = S3;
      end
    endcase
  end
endmodule
      
  
