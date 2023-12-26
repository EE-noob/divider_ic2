`timescale 1ns / 1ps
module divr2_test_top;
   parameter simulation_cycle = 100;

   parameter WIDTH=32;
   parameter EXPWIDTH=6;

     bit SystemClock;
  divr2_io top_io(SystemClock);
  test t(top_io);
  top_r2 
  #(
    .WIDTH(WIDTH ),
    .EXPWIDTH (
        EXPWIDTH )
  )
  top_r2_dut (
    .zdividend (top_io.zdividend ),
    .zdivisor (top_io.zdivisor ),
    .valid_in (top_io.valid_in ),
    .clk (top_io.clk ),
    .rst_n (top_io.rst_n ),
    .sign (top_io.sign ),
    .q (top_io.q ),
    .r (top_io.r ),
    .done (top_io.done ),
    .free (top_io.free ),
    .sign_o  ( top_io.sign_o)
  );

  initial begin
   $timeformat(-9, 1, "ns", 10);
   SystemClock = 0;
   forever begin
     #(simulation_cycle/2)
       SystemClock = ~SystemClock;
   end
 end

endmodule
