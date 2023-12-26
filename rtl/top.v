`timescale 1ns / 1ps
module top #(
    parameter DATA_WIDTH = 65,    
    parameter BUFFER_DEPTH = 4,  
    parameter LOG_BUFFER_DEPTH = 3,
    parameter WIDTH = 32,
    parameter EXPWIDTH = 6
) (
    input clk,//时钟
    input rst_n,//低有效复位信号
    input sign, //符号位
    input push_in,//fifo_in输入信号，将八位数据输入到fifo_in的寄存器中
    input [7:0] data_in_in,//fifo_in输入
    input  select,   // 0 divr2      1 fp32
    output [7:0] data_out_out,//fifo_out输出数据，
    output sign_out,//输出符号位
    output pull_out
);
wire  [64:0] data_in_out;
wire  [WIDTH-1:0] zdividend;
wire  [DATA_WIDTH-1:0]data_out_in;
wire  [WIDTH-1:0] zdivisor;
wire  [WIDTH-1:0] q;
wire  [WIDTH-1:0] r;
wire sign_n;
wire done;
wire sign_div_o;
wire valid_o;
assign zdividend= data_in_out[63:32];
assign zdivisor = data_in_out[31:0];
assign sign_n = data_in_out[64];

wire [31:0] fp32;

assign  data_out_in[64] = sign_div_o;
assign  data_out_in[63:0] = select? {fp32,32'b0} :{q,r};

wire valid_div,valid_div_o;
assign valid_div = select? 1'b0 : valid_o;
wire valid_fp32,valid_fp32_o;
assign valid_fp32 = select? valid_o : 1'b0 ;
assign done = select ? valid_fp32_o : valid_div_o;

wire io_ready;
wire done_ready;
assign done_ready = select ? io_ready : valid_div_o;

top_r2 
#(
  .WIDTH(WIDTH ),
  .EXPWIDTH (
      EXPWIDTH )
)
top_r2_dut (
  .zdividend (zdividend ),
  .zdivisor (zdivisor ),
  .valid_in (valid_div),
  .clk (clk ),
  .rst_n (rst_n ),
  .sign (sign_n ),
  .q (q ),          //
  .r (r ),          //
  .done (valid_div_o ),
  .free (),
  .sign_o  (  sign_div_o)
);

fp32top fp32_dut(
 .clock(clk),
 .reset(!rst_n),
 .io_din(data_in_out[63:0]),
 .io_valid_in(valid_fp32),
 .io_valid_out(valid_fp32_o),
 .io_fp32(fp32),
 .io_ready(io_ready)
);



fifo_top 
#(
  .DATA_WIDTH(DATA_WIDTH ),
  .BUFFER_DEPTH(BUFFER_DEPTH ),
  .LOG_BUFFER_DEPTH (
      LOG_BUFFER_DEPTH )
)
fifo_top_dut (
  .clk (clk ),
  .rst_n (rst_n ),
  .sign (sign ),
  .push_in (push_in ),
  .data_in_in (data_in_in ),
  .ready_i (done_ready),
  .data_out_in (data_out_in ),
  .valid_i (done ),
  .data_out_out (data_out_out ),
  .sign_out (sign_out ),
  .data_in_out (data_in_out ),
  .valid_o (valid_o ),
  .pull_out(pull_out)
);



endmodule
