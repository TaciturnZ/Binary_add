module Binary_add_11_1_tb();

    reg [10:0] A;
    reg [10:0] B;
    reg clk;
    reg rst_n;
    reg en;

    wire [10:0] S;

    integer i, j;
    reg [10:0] expected_S;

    Binary_add_11_1 uut (
        .A(A),
        .B(B),
        .S(S),
        .clk(clk),
        .rst_n(rst_n),
        .en(en)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin

        $dumpfile("wave.vcd");  // 指定波形文件的名称
        $dumpvars(0, Binary_add_11_1_tb); // Dump所有信号

        rst_n = 0;
        en = 0;
        A = 0;
        B = 0;

        // Apply reset
        #10;
        rst_n = 1;
        en = 1;

        for (i = 0; i <= 2047; i = i + 1) begin
            for (j = 0; j <= 2047; j = j + 1) begin
                @(negedge clk); 
                A = i[10:0]; 
                B = j[10:0];
                expected_S = i + j; 
                #1; 
                @(posedge clk); 
                #1;
                if (S !== expected_S[10:0]) begin
                    $display("ERROR: A=%d, B=%d, Expected S=%d, Actual S=%d", $unsigned(A), $unsigned(B), expected_S, S);
                end else begin
                    $display("PASS:  A=%d, B=%d, S=%d", $unsigned(A), $unsigned(B), $unsigned(S));
                end
            end
        end
        $finish;
    end

endmodule