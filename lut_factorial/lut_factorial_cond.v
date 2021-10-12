`include "lut_multiplier_32b_cond.v"

module lut_factorial_cond
(
    input resetn_32b,
    input clk_32b,
    input[31:0] source_number_32b,
    input start,
    output reg[63:0] factorial,
    output reg output_ready
);

/*--------------------------------------------------------------------------------------------------------------*/

reg enable_0, enable_1, control;
reg[31:0] predecessor, predecessor_seq;
reg[63:0] intern_fact, prev_fact;
wire[63:0] fact_LSB, fact_MSB;

/*--------------------------------------------------------------------------------------------------------------*/

/*always @ (*) begin
    if(resetn_32b) begin
        //intern_fact[31:0] = source_number_32b;
        predecessor = source_number_32b;
        prev_fact = source_number_32b;
        while(predecessor >= 2) begin
            predecessor = predecessor - 1;
            prev_fact = prev_fact * predecessor;
        end
    end else begin
        //intern_fact = 0;
        predecessor = 0;
        prev_fact = 0;
    end
end*/

always @ (posedge clk_32b) begin
    if(start) begin
        if(resetn_32b) begin
            enable_0 <= 1;
            control <= control + 1;

            /* Factorial compare */
            if(predecessor_seq == 1) begin      //intern_fact == prev_fact
                output_ready <= 1;
                factorial <= intern_fact;
            end
            else begin
                output_ready <= output_ready;
                factorial <= factorial;
            end

            intern_fact <= source_number_32b;
            predecessor_seq <= source_number_32b - 1;

            /* predecessor logic */
            if(enable_0) begin
                if(predecessor_seq < 2) begin
                    predecessor_seq <= 1;
                end 
                else begin
                    if(~control) begin
                        predecessor_seq <= predecessor_seq - 1;
                    end else begin
                        predecessor_seq <= predecessor_seq;
                    end
                end
                enable_1 <= 1;
            end
            else begin
                predecessor_seq <= source_number_32b - 1;
            end

            /* intern_fact logic */
            if(enable_1) begin
                intern_fact <= fact_LSB + fact_MSB;
            end else begin
                intern_fact <= source_number_32b;
            end
        end else begin
            enable_0 <= 0;
            enable_1 <= 0;
            control <= 0;
            output_ready <= 0;
            factorial <= 0;
            intern_fact <= 0;
            predecessor_seq <= 0;
        end
    end else begin
        enable_0 <= 0;
        enable_1 <= 0;
        factorial <= 0;
        control <= 0;
        output_ready <= 0;
    end
end 

/*--------------------------------------------------------------------------------------------------------------*/

//lut_multiplier_32b instances

lut_multiplier_32b_cond lut_32_LSB(
    .resetn_32b             (resetn_32b),
    .clk_32b                (clk_32b),
    .source_number_32b_0    (intern_fact[31:0]),
    .source_number_32b_1    (predecessor_seq),
    .result_64b             (fact_LSB)
);
      
lut_multiplier_32b_cond lut_32_MSB(
    .resetn_32b             (resetn_32b),
    .clk_32b                (clk_32b),
    .source_number_32b_0    (intern_fact[63:32]),
    .source_number_32b_1    (predecessor_seq),
    .result_64b             (fact_MSB)
);

endmodule