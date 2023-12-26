`timescale 1ns / 1ps
module pre_process#(
   parameter WIDTH = 32,
   parameter EXPWIDTH = 6
) 
(
   input [WIDTH-1:0] zdividend,
   input [WIDTH-1:0] zdivisor,
   input valid_in,
   input clk,
   input rst_n,
   input sign,
   input free,
   
   
   output [EXPWIDTH-1:0]cycle_num_out,
   output pass_flag_out,
   output zero_flag_divisor_out,
   output start_out,
   output dividend_sign_out,
   output divisor_sign_out,
   output [WIDTH-1:0] dividend_bn_out,
   output [WIDTH:0] divisor_bn_out,
   output [WIDTH-1:0] dividend_out,  
   output [EXPWIDTH:0] divisor_bit_out,
   output sign_o
   );
   wire [WIDTH-1:0] dividend,divisor;
   wire [EXPWIDTH:0] dividend_bit,divisor_bit;
   wire dividend_sign,divisor_sign;
   reg  [WIDTH-1:0] dividend_t,divisor_t;
   reg [EXPWIDTH:0] dividend_bit_t,divisor_bit_t;

   reg dividend_sign_t,divisor_sign_t,start_t,start_t2,sign_t,free2;
   assign dividend = sign?  {1'b0,zdividend[WIDTH-2:0]} : zdividend;
   assign divisor = sign?  {1'b0,zdivisor[WIDTH-2:0]} : zdivisor;    
   assign dividend_sign = sign & zdividend[WIDTH-1];
   assign divisor_sign = sign & zdivisor[WIDTH-1];    
   
assign dividend_bit =
(dividend[31]) ? ( 0) : (
(dividend[30]) ? ( 1) : (
(dividend[29]) ? ( 2) : (
(dividend[28]) ? ( 3) : (
(dividend[27]) ? ( 4) : (
(dividend[26]) ? ( 5) : (
(dividend[25]) ? ( 6) : (
(dividend[24]) ? ( 7) : (
(dividend[23]) ? ( 8) : (
(dividend[22]) ? ( 9) : (
(dividend[21]) ? (10) : (
(dividend[20]) ? (11) : (
(dividend[19]) ? (12) : (
(dividend[18]) ? (13) : (
(dividend[17]) ? (14) : (
(dividend[16]) ? (15) : (
(dividend[15]) ? (16) : (
(dividend[14]) ? (17) : (
(dividend[13]) ? (18) : (
(dividend[12]) ? (19) : (
(dividend[11]) ? (20) : (
(dividend[10]) ? (21) : (
(dividend[9]) ?  (22) : (
(dividend[8]) ?  (23) : (
(dividend[7]) ?  (24) : (
(dividend[6]) ?  (25) : (
(dividend[5]) ?  (26) : (
(dividend[4]) ?  (27) : (
(dividend[3]) ?  (28) : (
(dividend[2]) ?  (29) : (
(dividend[1]) ?  (30) : (
(dividend[0]) ?  (31) : (0
))))))))))))))))))))))))))))))));

assign divisor_bit =
(divisor[31]) ? ( 1) : (
(divisor[30]) ? ( 2) : (
(divisor[29]) ? ( 3) : (
(divisor[28]) ? ( 4) : (
(divisor[27]) ? ( 5) : (
(divisor[26]) ? ( 6) : (
(divisor[25]) ? ( 7) : (
(divisor[24]) ? ( 8) : (
(divisor[23]) ? ( 9) : (
(divisor[22]) ? (10) : (
(divisor[21]) ? (11) : (
(divisor[20]) ? (12) : (
(divisor[19]) ? (13) : (
(divisor[18]) ? (14) : (
(divisor[17]) ? (15) : (
(divisor[16]) ? (16) : (
(divisor[15]) ? (17) : (
(divisor[14]) ? (18) : (
(divisor[13]) ? (19) : (
(divisor[12]) ? (20) : (
(divisor[11]) ? (21) : (
(divisor[10]) ? (22) : (
(divisor[9]) ?  (23) : (
(divisor[8]) ?  (24) : (
(divisor[7]) ?  (25) : (
(divisor[6]) ?  (26) : (
(divisor[5]) ?  (27) : (
(divisor[4]) ?  (28) : (
(divisor[3]) ?  (29) : (
(divisor[2]) ?  (30) : (
(divisor[1]) ?  (31) : (
(divisor[0]) ?  (32) : (0
))))))))))))))))))))))))))))))));

always@(posedge clk or negedge rst_n) begin
if (~rst_n)
free2<=1'b1;
else
free2<=free;

end

reg [2:0] cnt;
reg rst_cnt_r;
wire rst_cnt = rst_cnt_r;

always@(posedge clk or negedge rst_n) begin
if (~rst_n)
cnt<=3'b100;
else if(rst_cnt)
cnt<=3'b000;
else if (cnt==3'b100)
cnt<=3'b100;
else
cnt<=cnt+1'b1;

end

wire cnt3 = cnt[2];


always @(posedge clk or negedge rst_n)begin
  if(~rst_n)begin
  dividend_sign_t<=1'b0;
  divisor_sign_t<=1'b0;
  dividend_bit_t<=6'b0;
  divisor_bit_t<=6'b0;
  dividend_t<=32'b0;
  divisor_t<=32'b0;
  start_t<=1'b0;
  start_t2<=1'b0;
  rst_cnt_r<=1'b0;   
  end
  else begin 
  start_t2<=start_t;
  if(valid_in && cnt3 && free2 )begin
  dividend_sign_t<=dividend_sign;
  divisor_sign_t<=divisor_sign;
  dividend_bit_t<=dividend_bit;
  divisor_bit_t<=divisor_bit;
  dividend_t<=dividend;
  divisor_t<=divisor;
  start_t<=1'b1;
  rst_cnt_r<=1'b1;  
  sign_t<=sign;
  end
  else begin
     dividend_sign_t<=dividend_sign_t;
  divisor_sign_t<=divisor_sign_t;
  dividend_bit_t<=dividend_bit_t;
  divisor_bit_t<=divisor_bit_t;
  dividend_t<=dividend_t;
     divisor_t<=divisor_t;
  start_t<=1'b0;
  start_t2<=start_t; 
  rst_cnt_r<=1'b0;   
  end
  end
  end
  
  assign start_out=(~start_t & start_t2);
  assign cycle_num_out= divisor_bit_t- dividend_bit_t ;
  assign pass_flag_out= (dividend_bit_t+1'b1>divisor_bit_t) ? 1'b1 : 1'b0;//·????
  assign zero_flag_divisor_out = (divisor_t) ? 1'b1 : 1'b0;    
  assign dividend_sign_out = dividend_sign_t;
  assign divisor_sign_out = divisor_sign_t;
  assign dividend_bn_out = dividend<<dividend_bit_t;
  assign divisor_bn_out =  divisor<<divisor_bit_t;    
  assign dividend_out = dividend_t;     
  assign divisor_bit_out =divisor_bit_t;     
       
  assign sign_o = sign_t;     
       
       
endmodule
