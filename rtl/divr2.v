`timescale 1ns / 1ps
 
module divr2#(
    parameter WIDTH = 32,
    parameter EXPWIDTH = 6
) 
(
    input [WIDTH-1:0] dividend_bn,
    input [WIDTH:0] divisor_bn,
    input [WIDTH-1:0] dividend,
    input start,
    input clk,
    input rst_n,
    input [EXPWIDTH-1:0]cycle_num,
    input pass_flag,
    input zero_flag_divisor,
    input dividend_sign,divisor_sign,
    input [EXPWIDTH:0] divisor_bit,

    output [WIDTH-1:0] q,
    output [WIDTH-1:0] r,
    output  done,
    output reg free
    );

    reg busy,busy2,pass,pass_out;
    reg [EXPWIDTH-1:0] count;
    reg [WIDTH-1:0] reg_q,q_out;

    reg [WIDTH+1:0] reg_r ,r_out,reg_b,subreg_b;
    //output ready
    assign done=(~busy&busy2)|pass_out;
    //sign??
    wire sign = dividend_sign|divisor_sign;

     //cal
    wire [1:0] qpm=(~reg_r[32]&reg_r[31])?2'b01:
                (reg_r[32]&~reg_r[31])?2'b10:2'b00;
                

    wire [WIDTH+1:0] sub_add= qpm==2'b00 ? {reg_r[WIDTH:0],1'b0}:
                                  qpm== 2'b01 ? {reg_r[WIDTH:0],1'b0}+subreg_b:
                                  qpm== 2'b10 ? {reg_r[WIDTH:0],1'b0}+reg_b:reg_r;


                                  
    wire [WIDTH-1:0] q_cal = qpm== 2'b00 ? {reg_q,1'b0}:
                                  qpm== 2'b01 ? {reg_q,1'b0}+1'b1:
                                  qpm== 2'b10 ? {reg_q,1'b0}+32'hffff_ffff:0;               
    //output restore
    wire sign_q = dividend_sign^divisor_sign;
    
    assign q = sign ? 
                r_out[33]? {sign_q,q_out[WIDTH-2:0]+31'h7fff_ffff}:{sign_q,q_out[WIDTH-2:0]}:
                r_out[33] ? q_out+32'hffff_ffff:q_out;
                
   wire [WIDTH-1:0] out_r_restore = (r_out+reg_b)>>(divisor_bit);             
   wire [WIDTH-1:0] out_r_norestore = (r_out>>(divisor_bit));
   assign r = pass? 
                sign? {dividend_sign,r_out[WIDTH-2:0]} : r_out :
                sign?
                r_out[33] ? {dividend_sign,out_r_restore[WIDTH-2:0]} :{dividend_sign,out_r_norestore[WIDTH-2:0]} :
                r_out[33] ?out_r_restore : out_r_norestore;  //rout-r·??
    
    
    
    always @(posedge clk or negedge rst_n)begin
    if(~rst_n)begin
        busy<=1'b0;
        busy2<=1'b0;
        count<=6'b0;
        free<=1'b1;
	    pass<=1'b0;
        pass_out <= 1'b0;

    end
     else begin
        busy2<=busy;

        if(start)begin//pulse
                free<=1'b0;
		pass_out<=pass_flag;
            if(~zero_flag_divisor)begin
                q_out<=32'h0;
                r_out<=34'h0;
                pass<=1'b1;
                free<=1'b1;        
            end else
            if(pass_flag)begin
                q_out<=32'b0;
                r_out<={2'b0,dividend};
                pass<=1'b1;
                free<=1'b1;
            end else begin
            reg_r<={2'b0,dividend_bn};
            reg_q<=0;
            reg_b<={1'b0,divisor_bn};   
            subreg_b<={1'b1,(~divisor_bn)+1'b1}; 
            count<=6'b0;
            busy<=1'b1;
            pass<=1'b0;
            end       
        end
           else 
	pass_out<=1'b0;
	if(busy)begin
            reg_r<=sub_add[WIDTH+1:0];          
            reg_q<=q_cal;
            count<=count+1'b1;
            if(count==cycle_num) 
            begin
            busy<=0;
            q_out<=reg_q;  //
            r_out<=reg_r;
            free<=1'b1;      
            end
        end
    end
    end                                  
        
        
endmodule
