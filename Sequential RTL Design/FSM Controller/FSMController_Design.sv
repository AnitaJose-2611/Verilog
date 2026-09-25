typedef enum logic [1:0]{
  IDLE,
  BUSY,
  WAIT_DONE
}state_t;

 state_t, state, next_state;

always_ff@(posedge clk) begin
  if(reset)
    state <= IDLE;
  else
    state <= next_state;
end

always_comb begin
  next_state = state;
  case(state)
    IDLE: begin
      if(start)
        next_state = BUSY;
    end
    BUSY: begin
      next_state = WAIT_DONE;
    end
    WAIT_DONE: begin
      if(done)
        next_state = IDLE;
    end
    default: begin
      next_state = IDLE;
    end
  endcase
end
