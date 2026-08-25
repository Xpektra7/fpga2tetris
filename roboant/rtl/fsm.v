module fsm(
    input wire clk,
    input wire reset,
    input wire L,
    input wire R,
    output reg TR,
    output reg TL,
    output reg FD
);

// defining states
localparam logic [1:0] LOST  = 2'b00,
                       RCCW  = 2'b01,
                       WALL1 = 2'b10,
                       WALL2 = 2'b11;

reg [1:0] current_state, next_state;

// sequential logic
always @(posedge clk, negedge reset) begin
    if (!reset) current_state <= LOST;
    else current_state <= next_state;
end

// combinational logic
always @(*) begin
    case(current_state)

        LOST:  next_state = (L | R) ? RCCW : LOST;

        RCCW:  next_state = (L | R) ? RCCW : WALL1;

        WALL1: next_state = (R) ? WALL2 : WALL1;

        WALL2: next_state = (L) ? RCCW : ((R) ? WALL2 : WALL1);

        default: next_state = LOST;

    endcase
end


// output logic
always @(*) begin
    case(next_state) 
        LOST:    {TR,TL,FD} = 3'b001;
        RCCW:    {TR,TL,FD} = 3'b010;
        WALL1:   {TR,TL,FD} = 3'b101;
        WALL2:   {TR,TL,FD} = 3'b011;
        default: {TR,TL,FD} = 3'b001;
    endcase
end


endmodule
