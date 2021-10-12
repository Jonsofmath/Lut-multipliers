module test
(
    input[63:0] result_2b,

    output reg resetn_2b,
    output reg clk_2b,
    output reg[31:0] source_number_2b_0,
    output reg[1:0] source_number_2b_1
);

initial begin
    $dumpfile("lut_multiplier_2b.vcd");
	$dumpvars;

    @(posedge clk_2b);
	@(posedge clk_2b);
    @(posedge clk_2b);
        source_number_2b_0 <= 852147;
    @(posedge clk_2b);
        source_number_2b_1 <= 0;
	@(posedge clk_2b);
        //source_number_2b_0 = 4;
        source_number_2b_1 <= 1;
	@(posedge clk_2b); 
        //source_number_2b_0 = 4;
        source_number_2b_1 <= 2;
	@(posedge clk_2b); 
        //source_number_2b_0 = 4;
        source_number_2b_1 <= 3;
    @(posedge clk_2b);@(posedge clk_2b);@(posedge clk_2b);@(posedge clk_2b);@(posedge clk_2b);@(posedge clk_2b);
        source_number_2b_1 <= 3;
    $finish;
end

//clk_2b.
initial clk_2b <= 0;
always	#2 clk_2b <= ~clk_2b;

//resetn.
initial
begin
	#0
	resetn_2b = 1'b1;
	@(posedge clk_2b);
	resetn_2b = 1'b1;
	@(posedge clk_2b);
	resetn_2b = 1'b0;
end

endmodule