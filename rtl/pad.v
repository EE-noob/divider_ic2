`timescale 1ns / 1ps
module pad #(
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

wire  clk_padi;
wire  rst_n_padi;
wire  sign_padi;
wire  select_padi;
wire  push_in_padi;
wire  [7:0]data_in_in_padi;
wire  [7:0]data_out_out_pado;
wire  sign_out_pado;
wire  pull_out_pado;
wire  select_padin;
top 
#(
  .DATA_WIDTH(DATA_WIDTH ),
  .BUFFER_DEPTH(BUFFER_DEPTH ),
  .LOG_BUFFER_DEPTH(LOG_BUFFER_DEPTH ),
  .WIDTH(WIDTH ),
  .EXPWIDTH (
      EXPWIDTH )
)
top_dut (
  .clk (clk_padi),
  .rst_n (rst_n_padi),
  .sign (sign_padi),
  .push_in (push_in_padi),
  .data_in_in (data_in_in_padi),
  .select(select_padi),
  .data_out_out (data_out_out_pado),
  .sign_out (sign_out_pado),
  .pull_out(pull_out_pado)
);



PIW  piw1
(
    .PAD(clk),
    .C(clk_padi)
);
PISW  piw2
(
    .PAD(rst_n),
    .C(rst_n_padi)
);
PIW  piw3
(
    .PAD(sign),
    .C(sign_padi)
);
PIW  piw4
(
    .PAD(push_in),
    .C(push_in_padi)
);
PIW  piw5
(
    .PAD(data_in_in[0]),
    .C(data_in_in_padi[0])
);
PIW  piw6
(
    .PAD(data_in_in[1]),
    .C(data_in_in_padi[1])
);
PIW  piw7
(
    .PAD(data_in_in[2]),
    .C(data_in_in_padi[2])
);
PIW  piw8
(
    .PAD(data_in_in[3]),
    .C(data_in_in_padi[3])
);
PIW  piw9
(
    .PAD(data_in_in[4]),
    .C(data_in_in_padi[4])
);
PIW  piw10
(
    .PAD(data_in_in[5]),
    .C(data_in_in_padi[5])
);
PIW  piw11
(
    .PAD(data_in_in[6]),
    .C(data_in_in_padi[6])
);
PIW  piw12
(
    .PAD(data_in_in[7]),
    .C(data_in_in_padi[7])
);
PIW  piw13
(
    .PAD(select),
    .C(select_padi)
);


PO16W po16w1
(
    .I(data_out_out_pado[0]),
    .PAD(data_out_out[0])
);
PO16W po16w2
(
    .I(data_out_out_pado[1]),
    .PAD(data_out_out[1])
);
PO16W po16w3
(
    .I(data_out_out_pado[2]),
    .PAD(data_out_out[2])
);
PO16W po16w4
(
    .I(data_out_out_pado[3]),
    .PAD(data_out_out[3])
);
PO16W po16w5
(
    .I(data_out_out_pado[4]),
    .PAD(data_out_out[4])
);
PO16W po16w6
(
    .I(data_out_out_pado[5]),
    .PAD(data_out_out[5])
);
PO16W po16w7
(
    .I(data_out_out_pado[6]),
    .PAD(data_out_out[6])
);
PO16W po16w8
(
    .I(data_out_out_pado[7]),
    .PAD(data_out_out[7])
);
PO16W po16w9
(
    .I(sign_out_pado),
    .PAD(sign_out)
);
PO16W po16w10
(
    .I(pull_out_pado),
    .PAD(pull_out)
);



endmodule
