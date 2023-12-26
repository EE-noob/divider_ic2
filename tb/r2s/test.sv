`timescale 1ns / 1ps
program automatic test(divr2_io.TB div_io);
  int run_for_n_packets;      // number of packets to test
  bit[31:0] N;
bit [30:0]Ndata;
bit Nsign;

  bit[31:0] D;
bit[30:0]Ddata;
bit Dsign;
  bit sign;
  logic[31:0] q_payload;
logic[30:0]q_payload_data;

  logic[31:0] r_payload;
logic[30:0]r_payload_data;

  logic[31:0] pkt2cmp_q_payload;
  logic[31:0] pkt2cmp_r_payload;

  initial begin
    $vcdpluson;

    run_for_n_packets = 20000;
    reset();
  repeat(run_for_n_packets) begin

    gen();

    fork
        send();
	    recv();
    join

    check();
  
  end
  repeat(10) @(div_io.cb);
  
end

task reset();
div_io.rst_n = 1'b0;

##2 div_io.cb.rst_n <= 1'b1;
repeat(15) @(div_io.cb);
endtask: reset

task gen();
Ndata=$urandom;
Nsign=$urandom;
Ddata=$urandom;
Dsign=$urandom;
N={Nsign,Ndata};
D={Dsign,Ddata};

q_payload_data=Ndata/Ddata;
r_payload_data=Ndata%Ddata;

q_payload={Nsign^Dsign,q_payload_data};
r_payload={Nsign,r_payload_data};

endtask:gen

task send();
  
	send_payload();

endtask: send


task send_payload();


div_io.cb.zdividend<=N;
div_io.cb.zdivisor<=D;
div_io.cb.valid_in<=1'b1;
div_io.cb.sign<=1'b1;
@(div_io.cb);

div_io.cb.valid_in<=1'b0;

endtask: send_payload

task recv();

get_payload();

endtask: recv

task get_payload();



fork
    begin: wd_timer_fork
    fork: done_wd_timer
      @(posedge div_io.cb.done); //this is a thread by itself
      begin                              //this is another thread
        repeat(1000) @(div_io.cb);
        $display("\n%m\n[ERROR]%t done signal timed out!\n", $realtime);
        $finish;
      end
    join_any: done_wd_timer
    disable fork;
    end: wd_timer_fork
  join


if(div_io.cb.done)begin
@(div_io.cb);
pkt2cmp_q_payload<=div_io.cb.q;
pkt2cmp_r_payload<=div_io.cb.r;
@(div_io.cb);
return;
end


endtask: get_payload

function bit compare(ref string message);

if(q_payload == pkt2cmp_q_payload && r_payload == pkt2cmp_r_payload) ;
else begin
  message = "Payload Content Mismatch:\n";
  message = { message, $sformatf("Packet Sent:   %x\n %x\n Pkt Received:   %x\n %x", q_payload, r_payload,pkt2cmp_q_payload,pkt2cmp_r_payload) };
  return (0);
end
message = "Successfully Compared";
return(1);
endfunction: compare

task check();

string message;
static int pkts_checked = 0;

if (!compare(message)) begin
    $display("\n%m\n[ERROR]%t Packet #%0d %s\n", $realtime, pkts_checked, message);
    $finish;
  end
  $display("[NOTE]%t Packet #%0d %s", $realtime, pkts_checked++, message);
endtask: check

endprogram: test
