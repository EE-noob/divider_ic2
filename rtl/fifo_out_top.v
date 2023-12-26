`timescale 1ns / 1ps
module fifo_out_top #(
    parameter DATA_WIDTH = 65,    
    parameter BUFFER_DEPTH = 4,  
    parameter LOG_BUFFER_DEPTH = 3
) (
    input clk,
    input rst_n,
    input [64:0] data_in,
    input valid_i,
    output [7:0] data_out,
    output sign_out,
    output pull_out
);
wire fifo_empty;
wire fifo_nempty; 
wire nfull;
wire [64:0] fifo_dout;


fifo_out 
#(
  .DATA_WIDTH(DATA_WIDTH ),
  .BUFFER_DEPTH(BUFFER_DEPTH ),
  .LOG_BUFFER_DEPTH (
      LOG_BUFFER_DEPTH )
)
fifo_out_dut (
  .clk_i (clk ),
  .rst_n (rst_n ),
  .ready_i (fifo_empty),
  .valid_i (valid_i ),
  .data_i (data_in),
  .data_o (fifo_dout),
  .nempty (fifo_nempty ),
  .nfull  ( nfull)
);




parallel2serial 
parallel2serial_dut (
  .clk (clk ),
  .rst_n (rst_n ),
  .en (fifo_nempty ),
  .data_i64 (fifo_dout ),
  .data_o (data_out),
  .empty (fifo_empty),
  .pull_out(pull_out),
  .sign_out  ( sign_out)
);




endmodule
