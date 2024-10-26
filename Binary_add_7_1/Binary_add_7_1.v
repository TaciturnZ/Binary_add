module Binary_add_7_1 (S, A, B, clk, rst_n, en);
    
    input [6:0] A; 
    input [6:0] B; 
    input clk, rst_n, en;

    output reg [6:0] S; // 和
    wire [6:0] sum;

    FA fa0 (.Sum(sum[0]), .Cout(C0), .A(A[0]), .B(B[0]), .Cin (1'b0));

    FA fa1 (.Sum(sum[1]), .Cout(C1), .A(A[1]), .B(B[1]), .Cin (C0));

    FA fa2 (.Sum(sum[2]), .Cout(C2), .A(A[2]), .B(B[2]), .Cin (C1));

    FA fa3 (.Sum(sum[3]), .Cout(C3), .A(A[3]), .B(B[3]), .Cin (C2));

    FA fa4 (.Sum(sum[4]), .Cout(C4), .A(A[4]), .B(B[4]), .Cin (C3));

    FA fa5 (.Sum(sum[5]), .Cout(C5), .A(A[5]), .B(B[5]), .Cin (C4));

    FA fa6 (.Sum(sum[6]), .Cout(C6), .A(A[6]), .B(B[6]), .Cin (C5));

    always @(posedge clk or negedge rst_n) begin
      if (!rst_n)
         S <= 7'd0;
      else if (en)
         S <= sum;
      else
         S <= S;
    end

endmodule
