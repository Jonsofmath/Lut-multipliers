`timescale 1ns/100ps

`include "lut_multiplier_32b_cond.v"
`include "test.v"

module test_bench;

wire resetn_32b, clk_32b;
wire[31:0] source_number_32b_0, source_number_32b_1;
wire[63:0] result_64b; 

lut_multiplier_32b_cond COND(
    /*AUTOINST*/
			     // Outputs
			     .result_64b	(result_64b[63:0]),
			     // Inputs
			     .resetn_32b	(resetn_32b),
			     .clk_32b		(clk_32b),
			     .source_number_32b_0(source_number_32b_0[31:0]),
			     .source_number_32b_1(source_number_32b_1[31:0]));

test TEST(
    /*AUTOINST*/
	  // Outputs
	  .resetn_32b			(resetn_32b),
	  .clk_32b			(clk_32b),
	  .source_number_32b_0		(source_number_32b_0[31:0]),
	  .source_number_32b_1		(source_number_32b_1[31:0]),
	  // Inputs
	  .result_64b			(result_64b[63:0]));
endmodule
