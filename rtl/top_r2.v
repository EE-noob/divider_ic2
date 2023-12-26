`timescale 1ns / 1ps
module top_r2#(
  parameter WIDTH = 32,
  parameter EXPWIDTH = 6
) 
(
input [WIDTH-1:0] zdividend,
  input [WIDTH-1:0] zdivisor,
  input valid_in,//???????????
  input clk,
  input rst_n,
  input sign,
  
      output [WIDTH-1:0] q,
  output [WIDTH-1:0] r,
  output  done,//??????θ????pulse
  output  free,
  output sign_o
  
  );
  wire [WIDTH-1:0] dividend_bn,dividend;
  wire [WIDTH:0] divisor_bn ;
  wire start ,pass_flag , zero_flag_divisor,dividend_sign,divisor_sign,free_inner;
  wire [EXPWIDTH-1:0]cycle_num ;
  wire [EXPWIDTH:0] divisor_bit ;
  
  assign free = free_inner;
  
    pre_process 
#(
  .WIDTH(WIDTH ),
  .EXPWIDTH (
      EXPWIDTH )
)
pre_process_dut (
  .zdividend (zdividend ),
  .zdivisor (zdivisor ),
  .valid_in (valid_in ),
  .clk (clk ),
  .rst_n (rst_n ),
  .sign (sign ),
  .cycle_num_out (cycle_num ),
  .pass_flag_out (pass_flag ),
  .zero_flag_divisor_out (zero_flag_divisor ),
  .start_out (start ),
  .dividend_sign_out (dividend_sign ),
  .divisor_sign_out (divisor_sign ),
  .dividend_bn_out (dividend_bn ),
  .divisor_bn_out (divisor_bn ),
  .dividend_out (dividend ),
  .divisor_bit_out  ( divisor_bit),
  .free(free_inner),
  .sign_o(sign_o)
);

  divr2 
#(
  .WIDTH(WIDTH ),
  .EXPWIDTH (
      EXPWIDTH )
)
divr2_dut (
  .dividend_bn (dividend_bn ),
  .divisor_bn (divisor_bn ),
  .dividend (dividend ),
  .start (start ),
  .clk (clk ),
  .rst_n (rst_n ),
  .cycle_num (cycle_num ),
  .pass_flag (pass_flag ),
  .zero_flag_divisor (zero_flag_divisor ),
  .dividend_sign (dividend_sign ),
  .divisor_sign (divisor_sign ),
  .divisor_bit (divisor_bit ),
  .q (q ),
  .r (r ),
  .done (done ),
  .free  ( free_inner)
);


endmodule
