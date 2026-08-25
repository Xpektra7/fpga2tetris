module seq_detect_1010(
  input wire x,
  input wire clk, reset,
  output reg Y
);

localparam logic [1:0] IDLE   = 2'b00,
                       S_1    = 2'b01,
                       S_10   = 2'b10,
                       S_101  = 2'b11;
                       //  S_1010 = 3'b100

reg [1:0] current_state, next_state;

//state memory
always @(posedge clk, posedge reset) begin
  if (reset == 1'b1) current_state <= IDLE;
  else current_state <= next_state;
end

//next state logic
always @(x, current_state) begin
  case (current_state)
    IDLE:begin
        if (x == 1'b0)
           next_state = IDLE;
        else next_state = S_1;
    end

    S_1:begin
        if (x == 1'b0) next_state = S_10;
        else next_state = S_1;
    end

    S_10:begin
        if (x == 1'b0) next_state = IDLE;
        else next_state = S_101;
    end

    S_101:begin
        if (x == 1'b0) next_state = IDLE;
        else next_state = S_1;
    end

    // S_1010:begin  if (x == 1'b0) begin
    //   next_state <= S_1010;
    // end
    // else next_state <= S_1
    // end
    default: next_state = IDLE;
  endcase

end

//output logic
always @(x, current_state) begin
  Y = (current_state == S_101 && x == 1'b1);
end

endmodule
