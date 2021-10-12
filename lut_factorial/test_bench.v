`timescale 1ns/100ps

`include "lut_factorial_cond.v"
`include "test.v"

module test_bench;

wire resetn_32b, start, output_ready, clk_32b;
wire[31:0] source_number_32b;
wire[63:0] factorial; 

lut_factorial_cond COND(
    /*AUTOINST*/
			// Outputs
			.factorial	(factorial[63:0]),
			.output_ready	(output_ready),
			// Inputs
			.resetn_32b	(resetn_32b),
			.clk_32b	(clk_32b),
			.source_number_32b(source_number_32b[31:0]),
			.start		(start));

test TEST(
    /*AUTOINST*/
	  // Outputs
	  .resetn_32b			(resetn_32b),
	  .clk_32b			(clk_32b),
	  .source_number_32b		(source_number_32b[31:0]),
	  .start			(start),
	  // Inputs
	  .factorial			(factorial[63:0]),
	  .output_ready			(output_ready));
endmodule
