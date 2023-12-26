`timescale 1ns / 1ps
module parallel2serial(
    input           clk,   
    input           rst_n,
	input 			en,
	input     	 	[64:0] data_i64,	
    output     		[7:0] data_o,   //一位输入
	output          sign_out,
	output  reg        empty,
	output  reg 	pull_out
    );
reg [2:0] cnt;
wire sign;
reg [63:0] data_reg;
assign sign = data_i64[64];
always @(posedge clk ,negedge rst_n) begin
	if (~rst_n) begin
		cnt <= 3'b0;
	end else if (en | (cnt != 3'b0)) begin
		cnt <= cnt + 1'b1;
	end else begin
		cnt <= 3'b0;
	end
end

always @(posedge clk ,negedge rst_n) begin
	if (~rst_n) begin
		pull_out <= 1'b0;
	end else if (en & (cnt == 3'b0)) begin
		pull_out <= 1'b1;
	end else begin
		pull_out <= 1'b0;
	end
end

always @(posedge clk ,negedge rst_n) begin
	if (~rst_n) begin
		empty <= 1'b0;
	end else if (cnt == 3'b111) begin
		empty <= 1'b1;
	end else begin
		empty <= 1'b0;
	end 
end


always @(posedge clk ,negedge rst_n) begin
	if (~rst_n) begin
		data_reg <= 64'b0;
	end else if (en & cnt==3'b0 ) begin
		data_reg <= data_i64[63:0];
	end else if (cnt) begin
		data_reg <= {8'b0,data_reg[63:8]};
	end else begin
		data_reg <= 64'b0;
	end
end
assign data_o = data_reg[7:0];
assign sign_out = sign;
endmodule

