`timescale 1ns / 1ps
interface divr2_io(input bit clk);
 logic rst_n;
 logic [31:0]zdividend;
 logic [31:0]zdivisor;
 logic valid_in;
 logic sign;
 logic [31:0]q;
 logic [31:0]r;
 logic done;
 logic free;
 logic sign_o;

 clocking cb @(posedge clk);
   default input #1 output #1;
   output rst_n;
   output zdividend;
   output zdivisor;
   output valid_in;
   output sign;
   input q;
   input r;
   input done;
   input free;
   input sign_o;
   endclocking

   modport TB(clocking cb,output rst_n);
   endinterface
   
