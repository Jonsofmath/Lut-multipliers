`timescale 1ns/100ps

`include "lut_multiplier_2b_cond.v"
`include "test.v"

module test_bench;

wire resetn_2b, clk_2b;
wire[31:0] source_number_2b_0;
wire[1:0] source_number_2b_1;
wire[63:0] result_2b; 

lut_multiplier_2b_cond COND(
    /*AUTOINST*/
			    // Outputs
			    .result_2b		(result_2b[63:0]),
			    // Inputs
			    .resetn_2b		(resetn_2b),
			    .clk_2b		(clk_2b),
			    .source_number_2b_0	(source_number_2b_0[31:0]),
			    .source_number_2b_1	(source_number_2b_1[1:0]));

test TEST(
    /*AUTOINST*/
	  // Outputs
	  .resetn_2b			(resetn_2b),
	  .clk_2b			(clk_2b),
	  .source_number_2b_0		(source_number_2b_0[31:0]),
	  .source_number_2b_1		(source_number_2b_1[1:0]),
	  // Inputs
	  .result_2b			(result_2b[63:0]));
endmodule
