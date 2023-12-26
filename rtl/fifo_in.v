`timescale 1ns / 1ps

module fifo_in
#(
parameter DATA_WIDTH = 65,     //宽度
parameter BUFFER_DEPTH = 4,     //深度
parameter LOG_BUFFER_DEPTH = 3)

(
input wire clk_i,  //输入时钟
input wire rst_ni,//输入重置
input wire ready_i,//读信号，可读取下一位，输出一个数据
input wire valid_i,//这个信号为高的时候，被装入数据
input wire [DATA_WIDTH - 1:0] data_i,//输入数据
output wire [DATA_WIDTH - 1:0] data_o,//输出数据
output wire valid_o,//能输出，还有数据
output wire nfull//没有装满
);
// Internal data structures
reg [LOG_BUFFER_DEPTH - 1:0] pointer_in; // location to which we last wrote

reg [LOG_BUFFER_DEPTH - 1:0] pointer_out; // location from which we last sent

reg [LOG_BUFFER_DEPTH-1:0] elements; // number of elements in the buffer

reg [DATA_WIDTH - 1:0] buffer [BUFFER_DEPTH - 1:0];//数据缓冲器

wire full;
integer loop1;

assign full = (elements == BUFFER_DEPTH);//定义满信号

always @(posedge clk_i or negedge rst_ni) begin : elements_sequential  //这行语句控制元素数量
if (rst_ni == 1'b0)
elements <= 0;
// ------------------
// Are we filling up?
// ------------------
// One out, none in
else if ((ready_i && valid_o) && (!valid_i || full))
elements <= elements - 1;
// None out, one in
else if (((!valid_o || !ready_i) && valid_i) && !full)
elements <= elements + 1;
// Else, either one out and one in, or none out and none in - stays unchanged
end

always @(posedge clk_i or negedge rst_ni) begin : buffers_sequential //放入缓冲器
if (rst_ni == 1'b0) begin
for (loop1 = 0; loop1 < BUFFER_DEPTH; loop1 = loop1 + 1)
buffer[loop1] <= 0;
end
else if (valid_i && !full) //有可输出的数据并且不满
// Update the memory
buffer[pointer_in] <= data_i;
end


always @(posedge clk_i or negedge rst_ni) begin : sequential  //输入输出指针，控制输入输出指针
if (rst_ni == 1'b0) begin
pointer_out <= 0;
pointer_in <= 0;
end 
else begin
// ------------------------------------
// Check what to do with the input side
// ------------------------------------
// We have some input, increase by 1 the input pointer
if (valid_i && !full) begin
if (pointer_in == $unsigned(BUFFER_DEPTH - 1))
pointer_in <= 0;
else
pointer_in <= pointer_in + 1;
end
// Else we don't have any input, the input pointer stays the same
// -------------------------------------
// Check what to do with the output side
// -------------------------------------
// We had pushed one flit out, we can try to go for the next one
if (ready_i && valid_o) begin
if (pointer_out == $unsigned(BUFFER_DEPTH - 1))
pointer_out <= 0;
else
pointer_out <= pointer_out + 1;
end
// Else stay on the same output location
end
end
// Update output ports
assign data_o = buffer[pointer_out];
assign valid_o = (elements != 0);
assign nfull = ~full;//仅仅用来输出full信号
endmodule
