//`timescale 10ps/1ps //all in vcs

module fp_tb;

  // Parameters
  localparam  DATA_WIDTH = 65;
  localparam  BUFFER_DEPTH = 4;
  localparam  LOG_BUFFER_DEPTH = 3;
  localparam  WIDTH = 32;
  localparam  EXPWIDTH = 6;
  localparam  clk_period=1170;//*10ps
localparam testdatanum=100;
  // Ports
  reg clk = 0;
  reg rst_n = 0;
  reg sign = 0;
  reg push_in = 0;
  reg [7:0] data_in_in;
  reg select = 1;// 0 divr2      1 fp32
  wire [7:0] data_out_out;
  wire sign_out;
  wire pull_out;

reg [31:0] ztest;
reg [63:0] qrtest;
reg [31:0] dtest;
wire [7:0] exp;
wire [22:0] frac;
wire [7:0] zexp;
wire [22:0] zfrac;
wire [7:0] dexp;
wire [22:0] dfrac;
integer cnt;
reg [63:0] myfrac;
reg [63:0] realfrac;
 real  e;
real  ritioe;
real  average_e=0;
  top #(
    .DATA_WIDTH(DATA_WIDTH ),
    .BUFFER_DEPTH(BUFFER_DEPTH ),
    .LOG_BUFFER_DEPTH(LOG_BUFFER_DEPTH ),
    .WIDTH(WIDTH ),
    .EXPWIDTH (
        EXPWIDTH )
  )
top_dut ( .data_in_in (data_in_in ), .data_out_out (data_out_out ),  .pull_out  ( pull_out) ,
 .sign_out (sign_out ), .select (select ),.push_in (push_in ),.sign (sign ), .rst_n (rst_n ), .clk (clk ));
  initial begin
repeat(testdatanum)
  begin
    $vcdpluson();
    rst_n = 0;
#(clk_period*2) rst_n = 1;
          push_in = 1;
          sign = 0;
          data_in_in = 8'hcf;
ztest[31:24]=data_in_in ;
#(clk_period)  data_in_in =  8'hff;
ztest[23:16]=data_in_in ;
#(clk_period)  data_in_in =  $random($time);
ztest[15:8]=data_in_in ;
#(clk_period)  data_in_in =  $random($time);
ztest[7:0]=data_in_in ;
#(clk_period) data_in_in =  8'h01;
dtest[31:24]=data_in_in ;
#(clk_period)  data_in_in =  $random($time);
dtest[23:16]=data_in_in ;
#(clk_period)  data_in_in = $random($time);
dtest[15:8]=data_in_in ;
#(clk_period)  data_in_in =  $random($time);
dtest[7:0]=data_in_in ;
#(clk_period)  push_in = 0;
#(clk_period*20);
  end
$display("clk_period=%d ps,freq=%dMHz",clk_period*10,1000*100/clk_period);
$display("***************************");
$display("***%d testdata all done!***",testdatanum);
$display("********finish!************");
$display("******average_e=%f%%;******",average_e*100/testdatanum);
$display("**************************");
$finish;
end

assign exp=qrtest[62:55];
assign frac=qrtest[54:32];
assign zexp=ztest[30:23];
assign zfrac=ztest[22:0];
assign dexp=dtest[30:23];
assign dfrac=dtest[22:0];

always begin
  #(clk_period/2) clk = ! clk ;
end
always @(posedge(clk)) begin
  if (pull_out)
  cnt<=0;
 qrtest[55:0]<=qrtest[63:8];
 qrtest[63:56]<=data_out_out;

  if (cnt<7&pull_out==0)
begin
 //$display("out=%b",data_out_out);
 qrtest[55:0]<=qrtest[63:8];
 qrtest[63:56]<=data_out_out;
cnt<=cnt+1;
 end
 if (cnt==7)
 begin
realfrac=(zfrac+2**23)*2**23/(dfrac+2**23);
myfrac=(frac+2**23);
if (myfrac>=realfrac)
e=(myfrac-realfrac);
else e=(realfrac-myfrac);

ritioe=e/realfrac;
$display("zfrac=%d;zexp=%d;dfrac=%d;dexp=%d;frac=%d;exp=%d;",zfrac,zexp,dfrac,dexp,frac,exp);
$display("myans=%d*2^(%d)",myfrac,exp-127-23);
$display("realans=%d*2^(%d)",realfrac,zexp-dexp-127-23);
$display("e=%d*2^-23,ritioe=%f%%",e,ritioe*100);
average_e=(average_e+ritioe);
cnt<=cnt+1;
 end

 
end


endmodule
