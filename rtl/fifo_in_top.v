`timescale 1ns / 1ps
module fifo_top_in #(
    parameter DATA_WIDTH = 65,
    parameter BUFFER_DEPTH = 4,
    parameter LOG_BUFFER_DEPTH = 3
  )(
    input clk,    //时钟
    input sign,   //符号位
    input push_in,
    input rst_n,  //复位信号，低位有效。
    input [7:0] data_in,//八位输入信号
    input ready_i,      //读信号，可读取下一位，输出一个数据
    output [64:0]data_out,//将65位数输出
    output valid_o        //buffer内有数据
  );


  wire [64:0] data_o2fifo;
  wire  ready_in2sp;
  wire  valid_os2p;


  fifo_in
    #(
      .DATA_WIDTH(DATA_WIDTH ),
      .BUFFER_DEPTH(BUFFER_DEPTH ),
      .LOG_BUFFER_DEPTH (
        LOG_BUFFER_DEPTH )
    )
    fifo_in_dut (
      .clk_i (clk ),
      .rst_ni (rst_n ),
      .ready_i (ready_i ),
      .valid_i (valid_os2p),
      .data_i (data_o2fifo),
      .data_o (data_out),
      .valid_o (valid_o),
      .nfull  (ready_in2sp)
    );


  serial2parallel
    serial2parallel_dut (
      .clk (clk ),
      .sign (sign ),
      .push_in (push_in ),
      .rst_n (rst_n ),
      .ready_i (ready_in2sp),
      .data_i (data_in ),
      .data_o (data_o2fifo),
      .valid_o  ( valid_os2p)
    );



endmodule
