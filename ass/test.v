module test(
    input A, B,
    output sum, cout
);

wire [1:0] input_ab = {A, B};
always @(A, B) begin
    // if (A == 1'b0 && B == 1'b0) begin
    //     sum = 0;
    //     cout = 0;
    // end
    // else if (A==1'b1 && B==1'b1) begin
    //     sum = 0;
    //     cout = 1;
    // end
    // else begin
    //     sum = 1;
    //     cout = 0;
    // end

    case (input_ab)
        2'b00:
            sum=1'b0;
            cout=1'b0;
        2'b11: begin
            sum=1'b0;
            cout=1'b1;
        end
        default: begin
            sum=1'b1;
            cout=1'b0;
        end
    endcase
end

endmodule
