//`-timescale 10ps/1ps //all in vcs

module srt2_tb;

  // Parameters
  localparam  DATA_WIDTH = 65;
  localparam  BUFFER_DEPTH = 4;
  localparam  LOG_BUFFER_DEPTH = 3;
  localparam  WIDTH = 32;
  localparam  EXPWIDTH = 6;
  localparam  clk_period=1000;//*10ps
localparam testdatanum=10;//*8 groups
  // Ports
  reg clk = 0;
  reg rst_n = 0;
  reg sign = 0;
  reg push_in = 0;
  reg [7:0] data_in_in;
  reg select = 0;// 0 divr2      1 fp32
  wire [7:0] data_out_out;
  wire sign_out;
  wire pull_out;
reg testfinish;
reg [31:0] ztest;
reg [63:0] qrtest;
reg [31:0] dtest;
integer cnt;
integer rightcnt=0;
integer out_file;

wire [127:0] qplus;
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
testfinish=0; $vcdpluson();    
data_in_in=0;
    rst_n = 0;
  #(clk_period) rst_n = 1;
repeat(testdatanum)
  begin

          push_in = 0;
  sign = 0;
#(clk_period)  data_in_in = $random($time);
ztest[31:24]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[23:16]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[15:8]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[7:0]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period) data_in_in =  $random($time)-15;
dtest[31:24]=data_in_in ;
#(clk_period) push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time)-15;
dtest[23:16]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in = $random($time);
dtest[15:8]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in =  $random($time);
dtest[7:0]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(100*clk_period);
  end
repeat(testdatanum)
  begin
          push_in = 0;
  sign = 0;
#(clk_period)  data_in_in = $random($time);
ztest[31:24]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[23:16]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[15:8]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[7:0]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period) data_in_in =  8'h00;
dtest[31:24]=data_in_in ;
#(clk_period) push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time)-15;
dtest[23:16]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in = $random($time)-15;
dtest[15:8]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in =  $random($time);
dtest[7:0]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(100*clk_period);
  end
repeat(testdatanum)
  begin

          push_in = 0;
  sign = 0;
#(clk_period)  data_in_in = $random($time);
ztest[31:24]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[23:16]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[15:8]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[7:0]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period) data_in_in = 8'h00;
dtest[31:24]=data_in_in ;
#(clk_period) push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in = 8'h00;
dtest[23:16]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in = $random($time)-15;
dtest[15:8]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in =  $random($time)-15;
dtest[7:0]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(100*clk_period);
  end
repeat(testdatanum)
  begin
   
          push_in = 0;
  sign = 0;
#(clk_period)  data_in_in = $random($time);
ztest[31:24]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[23:16]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[15:8]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[7:0]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period) data_in_in =  8'h00;
dtest[31:24]=data_in_in ;
#(clk_period) push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  8'h00;
dtest[23:16]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in = 8'h00;
dtest[15:8]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in =  $random($time)-15;
dtest[7:0]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(100*clk_period);
  end

repeat(testdatanum)
  begin

          push_in = 0;
  sign = 1;
#(clk_period)  data_in_in = $random($time);
ztest[31:24]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[23:16]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[15:8]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[7:0]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period) data_in_in =  $random($time)-15;
dtest[31:24]=data_in_in ;
#(clk_period) push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time)-15;
dtest[23:16]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in = $random($time);
dtest[15:8]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in =  $random($time);
dtest[7:0]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(100*clk_period);
  end
repeat(testdatanum)
  begin
          push_in = 0;
  sign = 1;
#(clk_period)  data_in_in = $random($time);
ztest[31:24]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[23:16]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[15:8]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[7:0]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period) data_in_in =  8'h00;
dtest[31:24]=data_in_in ;
#(clk_period) push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time)-15;
dtest[23:16]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in = $random($time)-15;
dtest[15:8]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in =  $random($time);
dtest[7:0]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(100*clk_period);
  end
repeat(testdatanum)
  begin

          push_in = 0;
  sign = 1;
#(clk_period)  data_in_in = $random($time);
ztest[31:24]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[23:16]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[15:8]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[7:0]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period) data_in_in = 8'h00;
dtest[31:24]=data_in_in ;
#(clk_period) push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in = 8'h00;
dtest[23:16]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in = $random($time)-15;
dtest[15:8]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in =  $random($time)-15;
dtest[7:0]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(100*clk_period);
  end
repeat(testdatanum)
  begin
   
          push_in = 0;
  sign = 1;
#(clk_period)  data_in_in = $random($time);
ztest[31:24]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[23:16]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[15:8]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  $random($time);
ztest[7:0]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period) data_in_in =  8'h00;
dtest[31:24]=data_in_in ;
#(clk_period) push_in= 1;
#(clk_period)   push_in = 0;
#(clk_period)  data_in_in =  8'h00;
dtest[23:16]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in = 8'h00;
dtest[15:8]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(clk_period)  data_in_in =  $random($time)-15;
dtest[7:0]=data_in_in ;
#(clk_period)  push_in= 1;
#(clk_period)  push_in = 0;
#(100*clk_period);
  end

testfinish=1;
#10
 $finish;
end
always@(testfinish) begin
if(testfinish) begin
    if(rightcnt==testdatanum*8) begin
$display("clk_period=%d ps,freq=%dMHz",clk_period*10,1000*100/clk_period);
$display("*******pass*******");
$display("******success*****");
$display("******************");
   $fclose(out_file);
end
else begin
$display("clk_period=%d ps,freq=%dMHz",clk_period*10,1000*100/clk_period);
  $display("！！！出错了！！！！");
 $display("%derrors in %d testdata",testdatanum*8-rightcnt,testdatanum*8);
   $fclose(out_file);
end
end

end
assign qplus=dtest*(qrtest[63:32]+1);
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

cnt<=8;
if (sign)begin 
 if (  ((ztest[30:0]!=dtest[30:0]*qrtest[62:32]+qrtest[30:0]) || qrtest[63]!=dtest[31]^ztest[31] ||(qrtest[31]!=ztest[31]) )&  dtest!=0)begin
 $display("signed:(%d)%d / (%d)%d=(%d)%d……(%d)%d  (0正1负)",(ztest[31]),ztest[30:0],(dtest[31]),dtest[30:0],(qrtest[31]),qrtest[62:32],(qrtest[31]),qrtest[30:0]);
  $display("!!!!!ans wrong!!!!!!");
 end
  else begin
 $display("signed:(%d)%d / (%d)%d=(%d)%d……(%d)%d  (0正1负)",(ztest[31]),ztest[30:0],(dtest[31]),dtest[30:0],(qrtest[31]),qrtest[62:32],(qrtest[31]),qrtest[30:0]);
$display("ans right!");
rightcnt<=rightcnt+1;
end 
end
else begin
 if (((ztest!=dtest*qrtest[63:32]+qrtest[31:0]) ||(ztest>qplus))& dtest!=0)begin
 $display("unsigned:%d / %d=%d……%d",ztest,dtest,qrtest[63:32],qrtest[31:0]);
  $display("!!!!!ans wrong!!!!!!");
 end
  else begin
$display("unsigned:%d / %d=%d……%d",ztest,dtest,qrtest[63:32],qrtest[31:0]);
$display("ans right!");
rightcnt<=rightcnt+1;

end
end

end
end

initial
begin
//if($test$plusargs("DUMP_FSDB"))
begin
$fsdbDumpfile("testname.fsdb");  //记录波形，波形名字testname.fsdb
$fsdbDumpvars("+all");  //+all参数，dump SV中的struct结构体
$fsdbDumpSVA();   //将assertion的结果存在fsdb中
$fsdbDumpMDA();  //dump memory arrays
//0: 当前级及其下面所有层级，如top.A, top.A.a，所有在top下面的多维数组均会被dump
//1: 仅仅dump当前组，也就是说，只dump top这一层的多维数组。
end

end


reg clk2=0;

always
begin
 #250 clk2=~clk2;
end


initial begin
  out_file=$fopen("./outputfile.coe","w");
  $fwrite(out_file,"memory_initialization_radix = 2;\n");
  $fwrite(out_file,"memory_initialization_vector =\n");
end
always @(posedge clk2)
begin
    $fwrite(out_file,"%b",sign_out);
    $fwrite(out_file,"%b",pull_out);
    $fwrite(out_file,"%b",data_out_out);

    $fwrite(out_file,"%b",data_in_in);
    $fwrite(out_file,"%b",push_in);
    $fwrite(out_file,"%b",sign);
    $fwrite(out_file,"%b",clk);
    $fwrite(out_file,"%b",select);
    $fwrite(out_file,"%b",rst_n);
    $fwrite(out_file,"\n");
    // $fwrite(out_file,"%d",$signed(reg_data))​​;     //fdisplay则会自动转行
end



endmodule


