module Binary_add_4_1 (S, A, B, clk, rst_n, en);
    
    input [3:0] A; 
    input [3:0] B; 
    input clk, rst_n, en;

    output reg [3:0] S; // 和
    wire [3:0] sum;

    FA fa0 (.Sum(sum[0]), .Cout(C0), .A(A[0]), .B(B[0]), .Cin (1'b0));

    FA fa1 (.Sum(sum[1]), .Cout(C1), .A(A[1]), .B(B[1]), .Cin (C0));

    FA fa2 (.Sum(sum[2]), .Cout(C2), .A(A[2]), .B(B[2]), .Cin (C1));

    FA fa3 (.Sum(sum[3]), .Cout(C3), .A(A[3]), .B(B[3]), .Cin (C2));

    always @(posedge clk or negedge rst_n) begin
      if (!rst_n)
         S <= 4'd0;
      else if (en)
         S <= sum;
      else
         S <= S;
    end

endmodule
