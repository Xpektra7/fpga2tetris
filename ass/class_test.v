module class_test(
input wire A, B,
output wire sum, cout
);

always  @(A, B) begin
    if (A==8'h00 && B==1'b0) begin
    sum = 0;
    cout = 0;
    end

    else if (A==1 && B==1) begin
    sum = 0;
    cout = 1;
    end

    //else if (A==1 && B==0) begin
    //sum = 1;
    //cout = 0;
    //end

    else  begin
    sum = 1;
    cout = 0;
    end
end


endmodule