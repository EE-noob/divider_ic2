`timescale 1ns / 1ps
module serial2parallel(
    input           clk,
	input           sign,
    input           rst_n,
	input           push_in,
	input 			ready_i,	//当fifo没有装满的时候拉至1.
    input    wire [7:0]       data_i,   //一位输入
    output   reg [64:0] data_o,	//64位并行输出
    output   reg       valid_o  //当计数满的时候拉至1
    );
reg [3:0] cnt;
always @(posedge clk or negedge rst_n) begin
	if (rst_n == 1'b0)begin
		data_o <= 65'b0;
		valid_o <=0;
		cnt <= 0;
		end
	else if (ready_i == 1'b1 & cnt == 4'b1000 )begin  //当计数到
		data_o[64] <= sign;	
        cnt <= 0;
        valid_o <= 1;
        end
	else if (ready_i == 1'b1 & push_in == 1'b1 )begin
		data_o <= {data_o[55:0], data_i};
		data_o[64] <= sign;	
		cnt <= cnt + 1'b1;
		valid_o <= 0;
		end	
	else
	begin
		data_o <= data_o;
		valid_o <= 0;
		data_o[64] <= sign;	
    end
	end
    
endmodule








