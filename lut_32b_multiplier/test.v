module test
(
    output reg resetn_32b,
    output reg clk_32b,
    output reg[31:0] source_number_32b_0,
    output reg[31:0] source_number_32b_1,

    input[63:0] result_64b
); 

initial begin
    $dumpfile("lut_multiplier_32b.vcd");
	$dumpvars;

    @(posedge clk_32b);
	@(posedge clk_32b);
    @(posedge clk_32b);
        source_number_32b_0 <= 120;
        source_number_32b_1 <= 2;
    repeat(2) @(posedge clk_32b);
        source_number_32b_0 <= 19;
        source_number_32b_1 <= 17;
    repeat(2) @(posedge clk_32b);
        source_number_32b_0 <= 3628800;
        source_number_32b_1 <= 11;
    repeat(2) @(posedge clk_32b);
        source_number_32b_0 <= 39916800;
        source_number_32b_1 <= 12;
    repeat(2) @(posedge clk_32b);
        source_number_32b_0 <= 39916800;
        source_number_32b_1 <= 3628800;
    repeat(27) @(posedge clk_32b);
        source_number_32b_0 <= 39916800;

    $finish;
end

//clk_32b.
initial clk_32b <= 0;
always	#2 clk_32b <= ~clk_32b;

//resetn.
initial
begin
	#0
	resetn_32b = 1'b1;
	@(posedge clk_32b);
	resetn_32b = 1'b1;
	@(posedge clk_32b);
	resetn_32b = 1'b0;
end

endmodule