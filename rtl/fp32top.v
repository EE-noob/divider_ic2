module fp32pack(
  input         io_sign,
  input  [7:0]  io_exponent,
  input  [22:0] io_fraction,
  output [31:0] io_fp32
);
  wire [8:0] _io_fp32_T = {io_sign,io_exponent}; // @[fp32pack.scala 10:22]
  assign io_fp32 = {_io_fp32_T,io_fraction}; // @[fp32pack.scala 10:37]
endmodule
module fp32unpack(
  input  [31:0] io_fp32,
  output        io_sign,
  output [7:0]  io_exponent,
  output [23:0] io_fraction
);
  assign io_sign = io_fp32[31]; // @[fp32unpack.scala 12:21]
  assign io_exponent = io_fp32[30:23]; // @[fp32unpack.scala 13:25]
  assign io_fraction = {1'h1,io_fp32[22:0]}; // @[fp32unpack.scala 14:22]
endmodule
module genMult(
  input         clock,
  input         reset,
  input  [23:0] io_a,
  input  [8:0]  io_x,
  output [32:0] io_p
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [32:0] pWire = io_a * io_x; // @[genMult.scala 11:20]
  reg [32:0] pReg; // @[genMult.scala 12:21]
  assign io_p = pReg; // @[genMult.scala 13:8]
  always @(posedge clock) begin
    if (reset) begin // @[genMult.scala 12:21]
      pReg <= 33'h0; // @[genMult.scala 12:21]
    end else begin
      pReg <= pWire; // @[genMult.scala 12:21]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  pReg = _RAND_0[32:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module genMult_1(
  input         clock,
  input         reset,
  input  [24:0] io_a,
  input  [16:0] io_x,
  output [41:0] io_p
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [41:0] pWire = io_a * io_x; // @[genMult.scala 11:20]
  reg [41:0] pReg; // @[genMult.scala 12:21]
  assign io_p = pReg; // @[genMult.scala 13:8]
  always @(posedge clock) begin
    if (reset) begin // @[genMult.scala 12:21]
      pReg <= 42'h0; // @[genMult.scala 12:21]
    end else begin
      pReg <= pWire; // @[genMult.scala 12:21]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  pReg = _RAND_0[41:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module genMult_2(
  input         clock,
  input         reset,
  input  [24:0] io_a,
  input  [24:0] io_x,
  output [49:0] io_p
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [49:0] pWire = io_a * io_x; // @[genMult.scala 11:20]
  reg [49:0] pReg; // @[genMult.scala 12:21]
  assign io_p = pReg; // @[genMult.scala 13:8]
  always @(posedge clock) begin
    if (reset) begin // @[genMult.scala 12:21]
      pReg <= 50'h0; // @[genMult.scala 12:21]
    end else begin
      pReg <= pWire; // @[genMult.scala 12:21]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  pReg = _RAND_0[49:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module genSub(
  input         clock,
  input         reset,
  input  [17:0] io_a,
  input  [16:0] io_b,
  output [16:0] io_s
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [17:0] _GEN_0 = {{1'd0}, io_b}; // @[genSub.scala 11:20]
  wire [17:0] sWire = io_a - _GEN_0; // @[genSub.scala 11:20]
  reg [17:0] sReg; // @[genSub.scala 12:21]
  assign io_s = sReg[16:0]; // @[genSub.scala 13:8]
  always @(posedge clock) begin
    if (reset) begin // @[genSub.scala 12:21]
      sReg <= 18'h0; // @[genSub.scala 12:21]
    end else begin
      sReg <= sWire; // @[genSub.scala 12:21]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  sReg = _RAND_0[17:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module genSub_1(
  input         clock,
  input         reset,
  input  [25:0] io_a,
  input  [24:0] io_b,
  output [24:0] io_s
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [25:0] _GEN_0 = {{1'd0}, io_b}; // @[genSub.scala 11:20]
  wire [25:0] sWire = io_a - _GEN_0; // @[genSub.scala 11:20]
  reg [25:0] sReg; // @[genSub.scala 12:21]
  assign io_s = sReg[24:0]; // @[genSub.scala 13:8]
  always @(posedge clock) begin
    if (reset) begin // @[genSub.scala 12:21]
      sReg <= 26'h0; // @[genSub.scala 12:21]
    end else begin
      sReg <= sWire; // @[genSub.scala 12:21]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  sReg = _RAND_0[25:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module divItr_Pip(
  input         clock,
  input         reset,
  input         io_valid_in,
  output        io_valid_out,
  input         io_sign_in,
  output        io_sign_out,
  input  [7:0]  io_exp_z,
  input  [7:0]  io_exp_d,
  output [7:0]  io_exp_out,
  input  [23:0] io_z,
  input  [23:0] io_d,
  output [22:0] io_q
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
`endif // RANDOMIZE_REG_INIT
  wire [7:0] lut_rom_addr; // @[divItr_pip.scala 13:19]
  wire [7:0] lut_rom_dout; // @[divItr_pip.scala 13:19]
  wire  itr1Mult_clock; // @[divItr_pip.scala 59:24]
  wire  itr1Mult_reset; // @[divItr_pip.scala 59:24]
  wire [23:0] itr1Mult_io_a; // @[divItr_pip.scala 59:24]
  wire [8:0] itr1Mult_io_x; // @[divItr_pip.scala 59:24]
  wire [32:0] itr1Mult_io_p; // @[divItr_pip.scala 59:24]
  wire  itr2Mult_clock; // @[divItr_pip.scala 60:24]
  wire  itr2Mult_reset; // @[divItr_pip.scala 60:24]
  wire [24:0] itr2Mult_io_a; // @[divItr_pip.scala 60:24]
  wire [16:0] itr2Mult_io_x; // @[divItr_pip.scala 60:24]
  wire [41:0] itr2Mult_io_p; // @[divItr_pip.scala 60:24]
  wire  itr3Mult_clock; // @[divItr_pip.scala 61:24]
  wire  itr3Mult_reset; // @[divItr_pip.scala 61:24]
  wire [24:0] itr3Mult_io_a; // @[divItr_pip.scala 61:24]
  wire [24:0] itr3Mult_io_x; // @[divItr_pip.scala 61:24]
  wire [49:0] itr3Mult_io_p; // @[divItr_pip.scala 61:24]
  wire  itr1Sub_clock; // @[divItr_pip.scala 62:23]
  wire  itr1Sub_reset; // @[divItr_pip.scala 62:23]
  wire [17:0] itr1Sub_io_a; // @[divItr_pip.scala 62:23]
  wire [16:0] itr1Sub_io_b; // @[divItr_pip.scala 62:23]
  wire [16:0] itr1Sub_io_s; // @[divItr_pip.scala 62:23]
  wire  itr2Sub_clock; // @[divItr_pip.scala 63:23]
  wire  itr2Sub_reset; // @[divItr_pip.scala 63:23]
  wire [25:0] itr2Sub_io_a; // @[divItr_pip.scala 63:23]
  wire [24:0] itr2Sub_io_b; // @[divItr_pip.scala 63:23]
  wire [24:0] itr2Sub_io_s; // @[divItr_pip.scala 63:23]
  wire [8:0] xitr0 = {1'h1,lut_rom_dout}; // @[divItr_pip.scala 15:19]
  reg  busyReg; // @[divItr_pip.scala 18:24]
  reg  pipReg_0; // @[divItr_pip.scala 19:23]
  reg  pipReg_1; // @[divItr_pip.scala 19:23]
  reg  pipReg_2; // @[divItr_pip.scala 19:23]
  reg  pipReg_3; // @[divItr_pip.scala 19:23]
  reg  pipReg_4; // @[divItr_pip.scala 19:23]
  reg  signReg_0; // @[divItr_pip.scala 34:24]
  reg  signReg_1; // @[divItr_pip.scala 34:24]
  reg  signReg_2; // @[divItr_pip.scala 34:24]
  reg  signReg_3; // @[divItr_pip.scala 34:24]
  reg  signReg_4; // @[divItr_pip.scala 34:24]
  wire  _GEN_6 = io_valid_in & io_sign_in; // @[divItr_pip.scala 36:{21,33} 37:27]
  wire  _GEN_7 = pipReg_0 & signReg_0; // @[divItr_pip.scala 38:{19,31} 39:27]
  wire  _GEN_8 = pipReg_1 & signReg_1; // @[divItr_pip.scala 40:{19,31} 41:27]
  wire  _GEN_9 = pipReg_2 & signReg_2; // @[divItr_pip.scala 42:{19,31} 43:27]
  wire  _GEN_10 = pipReg_3 & signReg_3; // @[divItr_pip.scala 44:{19,31} 45:27]
  reg  cntReg; // @[divItr_pip.scala 52:23]
  wire  _cntReg_T = ~cntReg; // @[divItr_pip.scala 53:40]
  reg [7:0] eReg_0; // @[divItr_pip.scala 56:21]
  reg [7:0] eReg_1; // @[divItr_pip.scala 56:21]
  reg [7:0] eReg_2; // @[divItr_pip.scala 56:21]
  reg [7:0] eReg_3; // @[divItr_pip.scala 56:21]
  reg [24:0] dReg; // @[divItr_pip.scala 64:21]
  reg [24:0] xReg_0; // @[divItr_pip.scala 65:21]
  reg [24:0] xReg_1; // @[divItr_pip.scala 65:21]
  reg [24:0] zReg_0; // @[divItr_pip.scala 66:21]
  reg [24:0] zReg_1; // @[divItr_pip.scala 66:21]
  wire [16:0] _itr1Sub_io_a_T = {9'h0,io_exp_z}; // @[divItr_pip.scala 83:30]
  wire [15:0] _itr1Sub_io_b_T = {8'h0,io_exp_d}; // @[divItr_pip.scala 84:30]
  wire [24:0] _GEN_13 = pipReg_0 & cntReg ? zReg_0 : 25'h0; // @[divItr_pip.scala 67:17 88:34 89:19]
  wire [24:0] _GEN_14 = pipReg_0 & cntReg ? xReg_0 : 25'h0; // @[divItr_pip.scala 68:17 88:34 90:19]
  wire [17:0] _GEN_15 = pipReg_0 & cntReg ? 18'h20000 : 18'h0; // @[divItr_pip.scala 69:16 88:34 91:18]
  wire [16:0] _GEN_16 = pipReg_0 & cntReg ? itr1Mult_io_p[32:16] : 17'h0; // @[divItr_pip.scala 70:16 88:34 92:18]
  wire [24:0] _GEN_19 = io_valid_in & _cntReg_T ? {{1'd0}, io_d} : _GEN_13; // @[divItr_pip.scala 80:33 81:19]
  wire [24:0] _GEN_20 = io_valid_in & _cntReg_T ? {{16'd0}, xitr0} : _GEN_14; // @[divItr_pip.scala 80:33 82:19]
  wire [25:0] _GEN_27 = pipReg_2 & cntReg ? 26'h2000000 : 26'h0; // @[divItr_pip.scala 103:34 104:18 73:16]
  wire [24:0] _GEN_28 = pipReg_2 & cntReg ? itr2Mult_io_p[40:16] : 25'h0; // @[divItr_pip.scala 103:34 105:18 74:16]
  wire [24:0] _GEN_29 = pipReg_2 & cntReg ? zReg_1 : 25'h0; // @[divItr_pip.scala 103:34 106:19 71:17]
  wire [24:0] _GEN_30 = pipReg_2 & cntReg ? xReg_1 : 25'h0; // @[divItr_pip.scala 103:34 107:19 72:17]
  wire [24:0] _GEN_34 = pipReg_1 & _cntReg_T ? {{8'd0}, itr1Sub_io_s} : _GEN_30; // @[divItr_pip.scala 100:19 97:31]
  wire  _T_9 = pipReg_4 & cntReg; // @[divItr_pip.scala 115:25]
  wire [7:0] _io_exp_out_T_1 = eReg_3 + 8'h1; // @[divItr_pip.scala 118:29]
  wire [7:0] _io_exp_out_T_3 = eReg_3 - 8'h1; // @[divItr_pip.scala 125:29]
  wire [22:0] _GEN_40 = itr3Mult_io_p[48] ? itr3Mult_io_p[47:25] : itr3Mult_io_p[46:24]; // @[divItr_pip.scala 120:35 121:12 124:12]
  wire [7:0] _GEN_41 = itr3Mult_io_p[48] ? eReg_3 : _io_exp_out_T_3; // @[divItr_pip.scala 120:35 122:18 125:18]
  wire [7:0] _GEN_42 = itr3Mult_io_p[49] ? _io_exp_out_T_1 : _GEN_41; // @[divItr_pip.scala 117:29 118:18]
  wire [22:0] _GEN_43 = itr3Mult_io_p[49] ? itr3Mult_io_p[48:26] : _GEN_40; // @[divItr_pip.scala 117:29 119:12]
  wire [7:0] _GEN_45 = pipReg_4 & cntReg ? _GEN_42 : 8'h0; // @[divItr_pip.scala 115:34 78:14]
  wire [22:0] _GEN_46 = pipReg_4 & cntReg ? _GEN_43 : 23'h0; // @[divItr_pip.scala 115:34 77:8]
  InlineBlackBoxLut lut ( // @[divItr_pip.scala 13:19]
    .rom_addr(lut_rom_addr),
    .rom_dout(lut_rom_dout)
  );
  genMult itr1Mult ( // @[divItr_pip.scala 59:24]
    .clock(itr1Mult_clock),
    .reset(itr1Mult_reset),
    .io_a(itr1Mult_io_a),
    .io_x(itr1Mult_io_x),
    .io_p(itr1Mult_io_p)
  );
  genMult_1 itr2Mult ( // @[divItr_pip.scala 60:24]
    .clock(itr2Mult_clock),
    .reset(itr2Mult_reset),
    .io_a(itr2Mult_io_a),
    .io_x(itr2Mult_io_x),
    .io_p(itr2Mult_io_p)
  );
  genMult_2 itr3Mult ( // @[divItr_pip.scala 61:24]
    .clock(itr3Mult_clock),
    .reset(itr3Mult_reset),
    .io_a(itr3Mult_io_a),
    .io_x(itr3Mult_io_x),
    .io_p(itr3Mult_io_p)
  );
  genSub itr1Sub ( // @[divItr_pip.scala 62:23]
    .clock(itr1Sub_clock),
    .reset(itr1Sub_reset),
    .io_a(itr1Sub_io_a),
    .io_b(itr1Sub_io_b),
    .io_s(itr1Sub_io_s)
  );
  genSub_1 itr2Sub ( // @[divItr_pip.scala 63:23]
    .clock(itr2Sub_clock),
    .reset(itr2Sub_reset),
    .io_a(itr2Sub_io_a),
    .io_b(itr2Sub_io_b),
    .io_s(itr2Sub_io_s)
  );
  assign io_valid_out = pipReg_3 & _cntReg_T ? 1'h0 : _T_9; // @[divItr_pip.scala 111:29 79:16]
  assign io_sign_out = pipReg_4 & signReg_4; // @[divItr_pip.scala 46:{19,32} 47:28]
  assign io_exp_out = pipReg_3 & _cntReg_T ? 8'h0 : _GEN_45; // @[divItr_pip.scala 111:29 78:14]
  assign io_q = pipReg_3 & _cntReg_T ? 23'h0 : _GEN_46; // @[divItr_pip.scala 111:29 77:8]
  assign lut_rom_addr = io_d[22:15]; // @[divItr_pip.scala 14:26]
  assign itr1Mult_clock = clock;
  assign itr1Mult_reset = reset;
  assign itr1Mult_io_a = _GEN_19[23:0];
  assign itr1Mult_io_x = _GEN_20[8:0];
  assign itr2Mult_clock = clock;
  assign itr2Mult_reset = reset;
  assign itr2Mult_io_a = pipReg_1 & _cntReg_T ? dReg : _GEN_29; // @[divItr_pip.scala 97:31 99:19]
  assign itr2Mult_io_x = _GEN_34[16:0];
  assign itr3Mult_clock = clock;
  assign itr3Mult_reset = reset;
  assign itr3Mult_io_a = pipReg_3 & _cntReg_T ? itr2Mult_io_p[40:16] : 25'h0; // @[divItr_pip.scala 111:29 112:19 75:17]
  assign itr3Mult_io_x = pipReg_3 & _cntReg_T ? itr2Sub_io_s : 25'h0; // @[divItr_pip.scala 111:29 113:19 76:17]
  assign itr1Sub_clock = clock;
  assign itr1Sub_reset = reset;
  assign itr1Sub_io_a = io_valid_in & _cntReg_T ? {{1'd0}, _itr1Sub_io_a_T} : _GEN_15; // @[divItr_pip.scala 80:33 83:18]
  assign itr1Sub_io_b = io_valid_in & _cntReg_T ? {{1'd0}, _itr1Sub_io_b_T} : _GEN_16; // @[divItr_pip.scala 80:33 84:18]
  assign itr2Sub_clock = clock;
  assign itr2Sub_reset = reset;
  assign itr2Sub_io_a = pipReg_1 & _cntReg_T ? 26'h0 : _GEN_27; // @[divItr_pip.scala 73:16 97:31]
  assign itr2Sub_io_b = pipReg_1 & _cntReg_T ? 25'h0 : _GEN_28; // @[divItr_pip.scala 74:16 97:31]
  always @(posedge clock) begin
    if (reset) begin // @[divItr_pip.scala 18:24]
      busyReg <= 1'h0; // @[divItr_pip.scala 18:24]
    end else begin
      busyReg <= io_valid_in | pipReg_0 | pipReg_1 | pipReg_2 | pipReg_3 | pipReg_4; // @[divItr_pip.scala 20:11]
    end
    if (reset) begin // @[divItr_pip.scala 19:23]
      pipReg_0 <= 1'h0; // @[divItr_pip.scala 19:23]
    end else begin
      pipReg_0 <= io_valid_in;
    end
    if (reset) begin // @[divItr_pip.scala 19:23]
      pipReg_1 <= 1'h0; // @[divItr_pip.scala 19:23]
    end else begin
      pipReg_1 <= pipReg_0;
    end
    if (reset) begin // @[divItr_pip.scala 19:23]
      pipReg_2 <= 1'h0; // @[divItr_pip.scala 19:23]
    end else begin
      pipReg_2 <= pipReg_1;
    end
    if (reset) begin // @[divItr_pip.scala 19:23]
      pipReg_3 <= 1'h0; // @[divItr_pip.scala 19:23]
    end else begin
      pipReg_3 <= pipReg_2;
    end
    if (reset) begin // @[divItr_pip.scala 19:23]
      pipReg_4 <= 1'h0; // @[divItr_pip.scala 19:23]
    end else begin
      pipReg_4 <= pipReg_3;
    end
    if (reset) begin // @[divItr_pip.scala 34:24]
      signReg_0 <= 1'h0; // @[divItr_pip.scala 34:24]
    end else begin
      signReg_0 <= _GEN_6;
    end
    if (reset) begin // @[divItr_pip.scala 34:24]
      signReg_1 <= 1'h0; // @[divItr_pip.scala 34:24]
    end else begin
      signReg_1 <= _GEN_7;
    end
    if (reset) begin // @[divItr_pip.scala 34:24]
      signReg_2 <= 1'h0; // @[divItr_pip.scala 34:24]
    end else begin
      signReg_2 <= _GEN_8;
    end
    if (reset) begin // @[divItr_pip.scala 34:24]
      signReg_3 <= 1'h0; // @[divItr_pip.scala 34:24]
    end else begin
      signReg_3 <= _GEN_9;
    end
    if (reset) begin // @[divItr_pip.scala 34:24]
      signReg_4 <= 1'h0; // @[divItr_pip.scala 34:24]
    end else begin
      signReg_4 <= _GEN_10;
    end
    if (reset) begin // @[divItr_pip.scala 52:23]
      cntReg <= 1'h0; // @[divItr_pip.scala 52:23]
    end else if (io_valid_in | busyReg) begin // @[divItr_pip.scala 53:29]
      cntReg <= ~cntReg; // @[divItr_pip.scala 53:37]
    end
    if (reset) begin // @[divItr_pip.scala 56:21]
      eReg_0 <= 8'h0; // @[divItr_pip.scala 56:21]
    end else if (!(io_valid_in & _cntReg_T)) begin // @[divItr_pip.scala 80:33]
      if (pipReg_0 & cntReg) begin // @[divItr_pip.scala 88:34]
        eReg_0 <= itr1Sub_io_s[7:0]; // @[divItr_pip.scala 93:13]
      end
    end
    if (reset) begin // @[divItr_pip.scala 56:21]
      eReg_1 <= 8'h0; // @[divItr_pip.scala 56:21]
    end else if (pipReg_1 & _cntReg_T) begin // @[divItr_pip.scala 97:31]
      eReg_1 <= eReg_0; // @[divItr_pip.scala 102:13]
    end
    if (reset) begin // @[divItr_pip.scala 56:21]
      eReg_2 <= 8'h0; // @[divItr_pip.scala 56:21]
    end else if (!(pipReg_1 & _cntReg_T)) begin // @[divItr_pip.scala 97:31]
      if (pipReg_2 & cntReg) begin // @[divItr_pip.scala 103:34]
        eReg_2 <= eReg_1; // @[divItr_pip.scala 108:13]
      end
    end
    if (reset) begin // @[divItr_pip.scala 56:21]
      eReg_3 <= 8'h0; // @[divItr_pip.scala 56:21]
    end else if (pipReg_3 & _cntReg_T) begin // @[divItr_pip.scala 111:29]
      eReg_3 <= eReg_2; // @[divItr_pip.scala 114:13]
    end
    if (reset) begin // @[divItr_pip.scala 64:21]
      dReg <= 25'h0; // @[divItr_pip.scala 64:21]
    end else if (!(io_valid_in & _cntReg_T)) begin // @[divItr_pip.scala 80:33]
      if (pipReg_0 & cntReg) begin // @[divItr_pip.scala 88:34]
        dReg <= itr1Mult_io_p[32:8]; // @[divItr_pip.scala 94:10]
      end
    end
    if (reset) begin // @[divItr_pip.scala 65:21]
      xReg_0 <= 25'h0; // @[divItr_pip.scala 65:21]
    end else if (io_valid_in & _cntReg_T) begin // @[divItr_pip.scala 80:33]
      xReg_0 <= {{16'd0}, xitr0}; // @[divItr_pip.scala 86:13]
    end
    if (reset) begin // @[divItr_pip.scala 65:21]
      xReg_1 <= 25'h0; // @[divItr_pip.scala 65:21]
    end else if (pipReg_1 & _cntReg_T) begin // @[divItr_pip.scala 97:31]
      xReg_1 <= {{8'd0}, itr1Sub_io_s}; // @[divItr_pip.scala 101:13]
    end
    if (reset) begin // @[divItr_pip.scala 66:21]
      zReg_0 <= 25'h0; // @[divItr_pip.scala 66:21]
    end else if (io_valid_in & _cntReg_T) begin // @[divItr_pip.scala 80:33]
      zReg_0 <= {{1'd0}, io_z}; // @[divItr_pip.scala 85:13]
    end
    if (reset) begin // @[divItr_pip.scala 66:21]
      zReg_1 <= 25'h0; // @[divItr_pip.scala 66:21]
    end else if (pipReg_1 & _cntReg_T) begin // @[divItr_pip.scala 97:31]
      zReg_1 <= itr1Mult_io_p[32:8]; // @[divItr_pip.scala 98:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  busyReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  pipReg_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  pipReg_1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  pipReg_2 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  pipReg_3 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  pipReg_4 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  signReg_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  signReg_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  signReg_2 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  signReg_3 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  signReg_4 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  cntReg = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  eReg_0 = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  eReg_1 = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  eReg_2 = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  eReg_3 = _RAND_15[7:0];
  _RAND_16 = {1{`RANDOM}};
  dReg = _RAND_16[24:0];
  _RAND_17 = {1{`RANDOM}};
  xReg_0 = _RAND_17[24:0];
  _RAND_18 = {1{`RANDOM}};
  xReg_1 = _RAND_18[24:0];
  _RAND_19 = {1{`RANDOM}};
  zReg_0 = _RAND_19[24:0];
  _RAND_20 = {1{`RANDOM}};
  zReg_1 = _RAND_20[24:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module fp32top(
  input         clock,
  input         reset,
  input  [63:0] io_din,
  input         io_valid_in,
  output        io_valid_out,
  output [31:0] io_fp32,
  output        io_ready
);
  wire  pack_io_sign; // @[fp32top.scala 10:20]
  wire [7:0] pack_io_exponent; // @[fp32top.scala 10:20]
  wire [22:0] pack_io_fraction; // @[fp32top.scala 10:20]
  wire [31:0] pack_io_fp32; // @[fp32top.scala 10:20]
  wire [31:0] zUnpack_io_fp32; // @[fp32top.scala 11:23]
  wire  zUnpack_io_sign; // @[fp32top.scala 11:23]
  wire [7:0] zUnpack_io_exponent; // @[fp32top.scala 11:23]
  wire [23:0] zUnpack_io_fraction; // @[fp32top.scala 11:23]
  wire [31:0] dUnpack_io_fp32; // @[fp32top.scala 12:23]
  wire  dUnpack_io_sign; // @[fp32top.scala 12:23]
  wire [7:0] dUnpack_io_exponent; // @[fp32top.scala 12:23]
  wire [23:0] dUnpack_io_fraction; // @[fp32top.scala 12:23]
  wire  div_clock; // @[fp32top.scala 13:19]
  wire  div_reset; // @[fp32top.scala 13:19]
  wire  div_io_valid_in; // @[fp32top.scala 13:19]
  wire  div_io_valid_out; // @[fp32top.scala 13:19]
  wire  div_io_sign_in; // @[fp32top.scala 13:19]
  wire  div_io_sign_out; // @[fp32top.scala 13:19]
  wire [7:0] div_io_exp_z; // @[fp32top.scala 13:19]
  wire [7:0] div_io_exp_d; // @[fp32top.scala 13:19]
  wire [7:0] div_io_exp_out; // @[fp32top.scala 13:19]
  wire [23:0] div_io_z; // @[fp32top.scala 13:19]
  wire [23:0] div_io_d; // @[fp32top.scala 13:19]
  wire [22:0] div_io_q; // @[fp32top.scala 13:19]
  fp32pack pack ( // @[fp32top.scala 10:20]
    .io_sign(pack_io_sign),
    .io_exponent(pack_io_exponent),
    .io_fraction(pack_io_fraction),
    .io_fp32(pack_io_fp32)
  );
  fp32unpack zUnpack ( // @[fp32top.scala 11:23]
    .io_fp32(zUnpack_io_fp32),
    .io_sign(zUnpack_io_sign),
    .io_exponent(zUnpack_io_exponent),
    .io_fraction(zUnpack_io_fraction)
  );
  fp32unpack dUnpack ( // @[fp32top.scala 12:23]
    .io_fp32(dUnpack_io_fp32),
    .io_sign(dUnpack_io_sign),
    .io_exponent(dUnpack_io_exponent),
    .io_fraction(dUnpack_io_fraction)
  );
  divItr_Pip div ( // @[fp32top.scala 13:19]
    .clock(div_clock),
    .reset(div_reset),
    .io_valid_in(div_io_valid_in),
    .io_valid_out(div_io_valid_out),
    .io_sign_in(div_io_sign_in),
    .io_sign_out(div_io_sign_out),
    .io_exp_z(div_io_exp_z),
    .io_exp_d(div_io_exp_d),
    .io_exp_out(div_io_exp_out),
    .io_z(div_io_z),
    .io_d(div_io_d),
    .io_q(div_io_q)
  );
  assign io_valid_out = div_io_valid_out; // @[fp32top.scala 29:16]
  assign io_fp32 = pack_io_fp32; // @[fp32top.scala 28:11]
  assign io_ready = io_valid_in; // @[fp32top.scala 14:22 15:14 17:14]
  assign pack_io_sign = div_io_sign_out; // @[fp32top.scala 30:16]
  assign pack_io_exponent = div_io_exp_out; // @[fp32top.scala 31:20]
  assign pack_io_fraction = div_io_q; // @[fp32top.scala 32:20]
  assign zUnpack_io_fp32 = io_din[63:32]; // @[fp32top.scala 19:28]
  assign dUnpack_io_fp32 = io_din[31:0]; // @[fp32top.scala 20:28]
  assign div_clock = clock;
  assign div_reset = reset;
  assign div_io_valid_in = io_valid_in; // @[fp32top.scala 21:19]
  assign div_io_sign_in = zUnpack_io_sign ^ dUnpack_io_sign; // @[fp32top.scala 22:37]
  assign div_io_exp_z = zUnpack_io_exponent; // @[fp32top.scala 23:16]
  assign div_io_exp_d = dUnpack_io_exponent; // @[fp32top.scala 24:16]
  assign div_io_z = zUnpack_io_fraction; // @[fp32top.scala 25:11]
  assign div_io_d = dUnpack_io_fraction; // @[fp32top.scala 26:11]
endmodule
