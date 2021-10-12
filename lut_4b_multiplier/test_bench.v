`timescale 1ns/100ps

`include "lut_multiplier_4b_cond.v"
`include "test.v"

module test_bench;

wire resetn_4b, clk_4b;
wire[31:0] source_number_4b_0;
wire[3:0] source_number_4b_1;
wire[63:0] result_4b; 

lut_multiplier_4b_cond COND(
    /*AUTOINST*/
			    // Outputs
			    .result_4b		(result_4b[63:0]),
			    // Inputs
			    .resetn_4b		(resetn_4b),
			    .clk_4b		(clk_4b),
			    .source_number_4b_0	(source_number_4b_0[31:0]),
			    .source_number_4b_1	(source_number_4b_1[3:0]));

test TEST(
    /*AUTOINST*/
	  // Outputs
	  .resetn_4b			(resetn_4b),
	  .clk_4b			(clk_4b),
	  .source_number_4b_0		(source_number_4b_0[31:0]),
	  .source_number_4b_1		(source_number_4b_1[3:0]),
	  // Inputs
	  .result_4b			(result_4b[63:0]));
endmodule
