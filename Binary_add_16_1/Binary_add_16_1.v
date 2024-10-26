module Binary_add_16_1 (S, A, B, clk, rst_n, en);
    
    input [15:0] A; 
    input [15:0] B; 
    input clk, rst_n, en;

    output reg [15:0] S; // 和
    wire [15:0] sum;

    FA fa0 (.Sum(sum[0]), .Cout(C0), .A(A[0]), .B(B[0]), .Cin (1'b0));

    FA fa1 (.Sum(sum[1]), .Cout(C1), .A(A[1]), .B(B[1]), .Cin (C0));

    FA fa2 (.Sum(sum[2]), .Cout(C2), .A(A[2]), .B(B[2]), .Cin (C1));

    FA fa3 (.Sum(sum[3]), .Cout(C3), .A(A[3]), .B(B[3]), .Cin (C2));

    FA fa4 (.Sum(sum[4]), .Cout(C4), .A(A[4]), .B(B[4]), .Cin (C3));

    FA fa5 (.Sum(sum[5]), .Cout(C5), .A(A[5]), .B(B[5]), .Cin (C4));

    FA fa6 (.Sum(sum[6]), .Cout(C6), .A(A[6]), .B(B[6]), .Cin (C5));

    FA fa7 (.Sum(sum[7]), .Cout(C7), .A(A[7]), .B(B[7]), .Cin (C6));

    FA fa8 (.Sum(sum[8]), .Cout(C8), .A(A[8]), .B(B[8]), .Cin (C7));

    FA fa9 (.Sum(sum[9]), .Cout(C9), .A(A[9]), .B(B[9]), .Cin (C8));

    FA fa10 (.Sum(sum[10]), .Cout(C10), .A(A[10]), .B(B[10]), .Cin (C9));

    FA fa11 (.Sum(sum[11]), .Cout(C11), .A(A[11]), .B(B[11]), .Cin (C10));

    FA fa12 (.Sum(sum[12]), .Cout(C12), .A(A[12]), .B(B[12]), .Cin (C11));

    FA fa13 (.Sum(sum[13]), .Cout(C13), .A(A[13]), .B(B[13]), .Cin (C12));

    FA fa14 (.Sum(sum[14]), .Cout(C14), .A(A[14]), .B(B[14]), .Cin (C13));

    FA fa15 (.Sum(sum[15]), .Cout(C15), .A(A[15]), .B(B[15]), .Cin (C14));

    always @(posedge clk or negedge rst_n) begin
      if (!rst_n)
         S <= 16'd0;
      else if (en)
         S <= sum;
      else
         S <= S;
    end

endmodule
