`timescale 1ns / 1ps
module fifo_top #(
    parameter DATA_WIDTH = 65,    
    parameter BUFFER_DEPTH = 4,  
    parameter LOG_BUFFER_DEPTH = 3
) (
    input clk,//时钟
    input rst_n,//低有效复位信号
    input sign, //符号位
    input push_in,//fifo_in输入信号，将八位数据输入到fifo_in的寄存器中
    input [7:0] data_in_in,//fifo_in输入
    input ready_i,//fifo_in的读取信号，控制指针加一
    input [64:0] data_out_in,//fifo_out数据输入
    input valid_i,//fifo_out输入信号，将65位数据输入到fifo_out的buffer中

    output [7:0] data_out_out,//fifo_out输出数据，
    output sign_out,//输出符号位
    output valid_o,
    output [64:0]data_in_out,//fifo_in输出数据
    output    pull_out
);


fifo_top_in 
#(
  .DATA_WIDTH(DATA_WIDTH ),
  .BUFFER_DEPTH(BUFFER_DEPTH ),
  .LOG_BUFFER_DEPTH (
      LOG_BUFFER_DEPTH )
)
fifo_top_in_dut (
  .clk (clk ),
  .sign (sign ),
  .push_in (push_in ),
  .rst_n (rst_n ),
  .data_in (data_in_in),
  .ready_i (ready_i ),
  .data_out (data_in_out ),
  .valid_o  ( valid_o)
);


fifo_out_top 
#(
  .DATA_WIDTH(DATA_WIDTH ),
  .BUFFER_DEPTH(BUFFER_DEPTH ),
  .LOG_BUFFER_DEPTH (
      LOG_BUFFER_DEPTH )
)
fifo_out_top_dut (
  .clk (clk ),
  .rst_n (rst_n ),
  .data_in (data_out_in ),
  .valid_i (valid_i ),
  .data_out (data_out_out ),
  .sign_out (sign_out ),
  .pull_out(pull_out)
);




endmodule
