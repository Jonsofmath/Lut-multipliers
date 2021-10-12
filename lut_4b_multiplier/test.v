module test
(
    output reg resetn_4b,
    output reg clk_4b,
    output reg[31:0] source_number_4b_0,
    output reg[3:0] source_number_4b_1,

    input[63:0] result_4b
);

initial begin
    $dumpfile("lut_multiplier_4b.vcd");
	$dumpvars;

    @(posedge clk_4b);
	@(posedge clk_4b);
    @(posedge clk_4b);
        source_number_4b_0 <= 85442222;
    @(posedge clk_4b);
        source_number_4b_1 <= 0;
	@(posedge clk_4b);
        source_number_4b_1 <= 3;
	@(posedge clk_4b); 
        source_number_4b_1 <= 8;
	@(posedge clk_4b); 
        source_number_4b_1 <= 2;
    @(posedge clk_4b);@(posedge clk_4b);@(posedge clk_4b);@(posedge clk_4b);@(posedge clk_4b);@(posedge clk_4b);
        source_number_4b_1 <= 3;
    $finish;
end

//clk_4b.
initial clk_4b <= 0;
always	#2 clk_4b <= ~clk_4b;

//resetn.
initial
begin
	#0
	resetn_4b = 1'b1;
	@(posedge clk_4b);
	resetn_4b = 1'b1;
	@(posedge clk_4b);
	resetn_4b = 1'b0;
end

endmodule