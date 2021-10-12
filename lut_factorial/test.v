module test
(
    output reg resetn_32b,
    output reg clk_32b,
    output reg[31:0] source_number_32b,
    output reg start,

    input[63:0] factorial,
    input output_ready
); 

initial begin
    $dumpfile("lut_factorial.vcd");
	$dumpvars;

	@(posedge clk_32b);
    @(posedge clk_32b);
        source_number_32b <= 12;
    repeat(35)@(posedge clk_32b);
        start <= 0;
    #677
        source_number_32b <= 13;
    $finish;
end

//clk_32b.
initial clk_32b <= 0;
always	#2 clk_32b <= ~clk_32b;

//resetn.
initial
begin
	#0
	start = 1'b0;
    resetn_32b = 1'b0;
	@(posedge clk_32b);
	start= 1'b0;
	@(posedge clk_32b);
	start = 1'b1;
    @(posedge clk_32b);
    resetn_32b = 1'b1;

    /*@(posedge clk_32b);@(posedge clk_32b);@(posedge clk_32b);@(posedge clk_32b);@(posedge clk_32b);@(posedge clk_32b);
    @(posedge clk_32b);@(posedge clk_32b);@(posedge clk_32b);@(posedge clk_32b);@(posedge clk_32b);@(posedge clk_32b);
    @(posedge clk_32b);@(posedge clk_32b);@(posedge clk_32b);@(posedge clk_32b);@(posedge clk_32b);@(posedge clk_32b);
    @(posedge clk_32b);@(posedge clk_32b);@(posedge clk_32b);@(posedge clk_32b);@(posedge clk_32b);@(posedge clk_32b);
        start = 1'b0;*/


end

endmodule