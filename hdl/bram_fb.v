//Copyright (C)2014-2021 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//GOWIN Version: V1.9.8
//Part Number: GW1NR-LV9QN88PC6/I5
//Device: GW1NR-9C
//Created Time: Mon Jul 18 20:42:15 2022

module bram_fb (dout, clka, cea, reseta, clkb, ceb, resetb, oce, ada, din, adb);

output [35:0] dout;
input clka;
input cea;
input reseta;
input clkb;
input ceb;
input resetb;
input oce;
input [13:0] ada;
input [35:0] din;
input [13:0] adb;

wire lut_f_0;
wire lut_f_1;
wire [26:0] sdpx9b_inst_0_dout_w;
wire [8:0] sdpx9b_inst_0_dout;
wire [26:0] sdpx9b_inst_1_dout_w;
wire [8:0] sdpx9b_inst_1_dout;
wire [26:0] sdpx9b_inst_2_dout_w;
wire [8:0] sdpx9b_inst_2_dout;
wire [26:0] sdpx9b_inst_3_dout_w;
wire [8:0] sdpx9b_inst_3_dout;
wire [26:0] sdpx9b_inst_4_dout_w;
wire [17:9] sdpx9b_inst_4_dout;
wire [26:0] sdpx9b_inst_5_dout_w;
wire [17:9] sdpx9b_inst_5_dout;
wire [26:0] sdpx9b_inst_6_dout_w;
wire [17:9] sdpx9b_inst_6_dout;
wire [26:0] sdpx9b_inst_7_dout_w;
wire [17:9] sdpx9b_inst_7_dout;
wire [26:0] sdpx9b_inst_8_dout_w;
wire [8:0] sdpx9b_inst_8_dout;
wire [26:0] sdpx9b_inst_9_dout_w;
wire [8:0] sdpx9b_inst_9_dout;
wire [26:0] sdpx9b_inst_10_dout_w;
wire [17:9] sdpx9b_inst_10_dout;
wire [26:0] sdpx9b_inst_11_dout_w;
wire [17:9] sdpx9b_inst_11_dout;
wire [17:0] sdpx9b_inst_12_dout_w;
wire [17:0] sdpx9b_inst_12_dout;
wire [26:0] sdpx9b_inst_13_dout_w;
wire [26:18] sdpx9b_inst_13_dout;
wire [26:0] sdpx9b_inst_14_dout_w;
wire [26:18] sdpx9b_inst_14_dout;
wire [26:0] sdpx9b_inst_15_dout_w;
wire [26:18] sdpx9b_inst_15_dout;
wire [26:0] sdpx9b_inst_16_dout_w;
wire [26:18] sdpx9b_inst_16_dout;
wire [26:0] sdpx9b_inst_17_dout_w;
wire [35:27] sdpx9b_inst_17_dout;
wire [26:0] sdpx9b_inst_18_dout_w;
wire [35:27] sdpx9b_inst_18_dout;
wire [26:0] sdpx9b_inst_19_dout_w;
wire [35:27] sdpx9b_inst_19_dout;
wire [26:0] sdpx9b_inst_20_dout_w;
wire [35:27] sdpx9b_inst_20_dout;
wire [26:0] sdpx9b_inst_21_dout_w;
wire [26:18] sdpx9b_inst_21_dout;
wire [26:0] sdpx9b_inst_22_dout_w;
wire [26:18] sdpx9b_inst_22_dout;
wire [26:0] sdpx9b_inst_23_dout_w;
wire [35:27] sdpx9b_inst_23_dout;
wire [26:0] sdpx9b_inst_24_dout_w;
wire [35:27] sdpx9b_inst_24_dout;
wire [17:0] sdpx9b_inst_25_dout_w;
wire [35:18] sdpx9b_inst_25_dout;
wire dff_q_0;
wire dff_q_1;
wire dff_q_2;
wire mux_o_7;
wire mux_o_8;
wire mux_o_9;
wire mux_o_11;
wire mux_o_12;
wire mux_o_21;
wire mux_o_22;
wire mux_o_23;
wire mux_o_25;
wire mux_o_26;
wire mux_o_35;
wire mux_o_36;
wire mux_o_37;
wire mux_o_39;
wire mux_o_40;
wire mux_o_49;
wire mux_o_50;
wire mux_o_51;
wire mux_o_53;
wire mux_o_54;
wire mux_o_63;
wire mux_o_64;
wire mux_o_65;
wire mux_o_67;
wire mux_o_68;
wire mux_o_77;
wire mux_o_78;
wire mux_o_79;
wire mux_o_81;
wire mux_o_82;
wire mux_o_91;
wire mux_o_92;
wire mux_o_93;
wire mux_o_95;
wire mux_o_96;
wire mux_o_105;
wire mux_o_106;
wire mux_o_107;
wire mux_o_109;
wire mux_o_110;
wire mux_o_119;
wire mux_o_120;
wire mux_o_121;
wire mux_o_123;
wire mux_o_124;
wire mux_o_133;
wire mux_o_134;
wire mux_o_135;
wire mux_o_137;
wire mux_o_138;
wire mux_o_147;
wire mux_o_148;
wire mux_o_149;
wire mux_o_151;
wire mux_o_152;
wire mux_o_161;
wire mux_o_162;
wire mux_o_163;
wire mux_o_165;
wire mux_o_166;
wire mux_o_175;
wire mux_o_176;
wire mux_o_177;
wire mux_o_179;
wire mux_o_180;
wire mux_o_189;
wire mux_o_190;
wire mux_o_191;
wire mux_o_193;
wire mux_o_194;
wire mux_o_203;
wire mux_o_204;
wire mux_o_205;
wire mux_o_207;
wire mux_o_208;
wire mux_o_217;
wire mux_o_218;
wire mux_o_219;
wire mux_o_221;
wire mux_o_222;
wire mux_o_231;
wire mux_o_232;
wire mux_o_233;
wire mux_o_235;
wire mux_o_236;
wire mux_o_245;
wire mux_o_246;
wire mux_o_247;
wire mux_o_249;
wire mux_o_250;
wire mux_o_259;
wire mux_o_260;
wire mux_o_261;
wire mux_o_263;
wire mux_o_264;
wire mux_o_273;
wire mux_o_274;
wire mux_o_275;
wire mux_o_277;
wire mux_o_278;
wire mux_o_287;
wire mux_o_288;
wire mux_o_289;
wire mux_o_291;
wire mux_o_292;
wire mux_o_301;
wire mux_o_302;
wire mux_o_303;
wire mux_o_305;
wire mux_o_306;
wire mux_o_315;
wire mux_o_316;
wire mux_o_317;
wire mux_o_319;
wire mux_o_320;
wire mux_o_329;
wire mux_o_330;
wire mux_o_331;
wire mux_o_333;
wire mux_o_334;
wire mux_o_343;
wire mux_o_344;
wire mux_o_345;
wire mux_o_347;
wire mux_o_348;
wire mux_o_357;
wire mux_o_358;
wire mux_o_359;
wire mux_o_361;
wire mux_o_362;
wire mux_o_371;
wire mux_o_372;
wire mux_o_373;
wire mux_o_375;
wire mux_o_376;
wire mux_o_385;
wire mux_o_386;
wire mux_o_387;
wire mux_o_389;
wire mux_o_390;
wire mux_o_399;
wire mux_o_400;
wire mux_o_401;
wire mux_o_403;
wire mux_o_404;
wire mux_o_413;
wire mux_o_414;
wire mux_o_415;
wire mux_o_417;
wire mux_o_418;
wire mux_o_427;
wire mux_o_428;
wire mux_o_429;
wire mux_o_431;
wire mux_o_432;
wire mux_o_441;
wire mux_o_442;
wire mux_o_443;
wire mux_o_445;
wire mux_o_446;
wire mux_o_455;
wire mux_o_456;
wire mux_o_457;
wire mux_o_459;
wire mux_o_460;
wire mux_o_469;
wire mux_o_470;
wire mux_o_471;
wire mux_o_473;
wire mux_o_474;
wire mux_o_483;
wire mux_o_484;
wire mux_o_485;
wire mux_o_487;
wire mux_o_488;
wire mux_o_497;
wire mux_o_498;
wire mux_o_499;
wire mux_o_501;
wire mux_o_502;
wire gw_vcc;
wire gw_gnd;

assign gw_vcc = 1'b1;
assign gw_gnd = 1'b0;

LUT4 lut_inst_0 (
  .F(lut_f_0),
  .I0(ada[10]),
  .I1(ada[11]),
  .I2(ada[12]),
  .I3(ada[13])
);
defparam lut_inst_0.INIT = 16'h1000;
LUT4 lut_inst_1 (
  .F(lut_f_1),
  .I0(adb[10]),
  .I1(adb[11]),
  .I2(adb[12]),
  .I3(adb[13])
);
defparam lut_inst_1.INIT = 16'h1000;
SDPX9B sdpx9b_inst_0 (
    .DO({sdpx9b_inst_0_dout_w[26:0],sdpx9b_inst_0_dout[8:0]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_0.READ_MODE = 1'b0;
defparam sdpx9b_inst_0.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_0.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_0.BLK_SEL_0 = 3'b000;
defparam sdpx9b_inst_0.BLK_SEL_1 = 3'b000;
defparam sdpx9b_inst_0.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_1 (
    .DO({sdpx9b_inst_1_dout_w[26:0],sdpx9b_inst_1_dout[8:0]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_1.READ_MODE = 1'b0;
defparam sdpx9b_inst_1.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_1.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_1.BLK_SEL_0 = 3'b001;
defparam sdpx9b_inst_1.BLK_SEL_1 = 3'b001;
defparam sdpx9b_inst_1.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_2 (
    .DO({sdpx9b_inst_2_dout_w[26:0],sdpx9b_inst_2_dout[8:0]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_2.READ_MODE = 1'b0;
defparam sdpx9b_inst_2.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_2.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_2.BLK_SEL_0 = 3'b010;
defparam sdpx9b_inst_2.BLK_SEL_1 = 3'b010;
defparam sdpx9b_inst_2.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_3 (
    .DO({sdpx9b_inst_3_dout_w[26:0],sdpx9b_inst_3_dout[8:0]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_3.READ_MODE = 1'b0;
defparam sdpx9b_inst_3.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_3.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_3.BLK_SEL_0 = 3'b011;
defparam sdpx9b_inst_3.BLK_SEL_1 = 3'b011;
defparam sdpx9b_inst_3.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_4 (
    .DO({sdpx9b_inst_4_dout_w[26:0],sdpx9b_inst_4_dout[17:9]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[17:9]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_4.READ_MODE = 1'b0;
defparam sdpx9b_inst_4.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_4.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_4.BLK_SEL_0 = 3'b000;
defparam sdpx9b_inst_4.BLK_SEL_1 = 3'b000;
defparam sdpx9b_inst_4.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_5 (
    .DO({sdpx9b_inst_5_dout_w[26:0],sdpx9b_inst_5_dout[17:9]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[17:9]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_5.READ_MODE = 1'b0;
defparam sdpx9b_inst_5.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_5.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_5.BLK_SEL_0 = 3'b001;
defparam sdpx9b_inst_5.BLK_SEL_1 = 3'b001;
defparam sdpx9b_inst_5.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_6 (
    .DO({sdpx9b_inst_6_dout_w[26:0],sdpx9b_inst_6_dout[17:9]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[17:9]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_6.READ_MODE = 1'b0;
defparam sdpx9b_inst_6.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_6.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_6.BLK_SEL_0 = 3'b010;
defparam sdpx9b_inst_6.BLK_SEL_1 = 3'b010;
defparam sdpx9b_inst_6.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_7 (
    .DO({sdpx9b_inst_7_dout_w[26:0],sdpx9b_inst_7_dout[17:9]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[17:9]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_7.READ_MODE = 1'b0;
defparam sdpx9b_inst_7.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_7.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_7.BLK_SEL_0 = 3'b011;
defparam sdpx9b_inst_7.BLK_SEL_1 = 3'b011;
defparam sdpx9b_inst_7.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_8 (
    .DO({sdpx9b_inst_8_dout_w[26:0],sdpx9b_inst_8_dout[8:0]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_8.READ_MODE = 1'b0;
defparam sdpx9b_inst_8.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_8.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_8.BLK_SEL_0 = 3'b100;
defparam sdpx9b_inst_8.BLK_SEL_1 = 3'b100;
defparam sdpx9b_inst_8.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_9 (
    .DO({sdpx9b_inst_9_dout_w[26:0],sdpx9b_inst_9_dout[8:0]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_9.READ_MODE = 1'b0;
defparam sdpx9b_inst_9.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_9.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_9.BLK_SEL_0 = 3'b101;
defparam sdpx9b_inst_9.BLK_SEL_1 = 3'b101;
defparam sdpx9b_inst_9.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_10 (
    .DO({sdpx9b_inst_10_dout_w[26:0],sdpx9b_inst_10_dout[17:9]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[17:9]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_10.READ_MODE = 1'b0;
defparam sdpx9b_inst_10.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_10.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_10.BLK_SEL_0 = 3'b100;
defparam sdpx9b_inst_10.BLK_SEL_1 = 3'b100;
defparam sdpx9b_inst_10.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_11 (
    .DO({sdpx9b_inst_11_dout_w[26:0],sdpx9b_inst_11_dout[17:9]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[17:9]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_11.READ_MODE = 1'b0;
defparam sdpx9b_inst_11.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_11.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_11.BLK_SEL_0 = 3'b101;
defparam sdpx9b_inst_11.BLK_SEL_1 = 3'b101;
defparam sdpx9b_inst_11.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_12 (
    .DO({sdpx9b_inst_12_dout_w[17:0],sdpx9b_inst_12_dout[17:0]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_0}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_1}),
    .ADA({ada[9:0],gw_gnd,gw_gnd,gw_vcc,gw_vcc}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[17:0]}),
    .ADB({adb[9:0],gw_gnd,gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_12.READ_MODE = 1'b0;
defparam sdpx9b_inst_12.BIT_WIDTH_0 = 18;
defparam sdpx9b_inst_12.BIT_WIDTH_1 = 18;
defparam sdpx9b_inst_12.BLK_SEL_0 = 3'b001;
defparam sdpx9b_inst_12.BLK_SEL_1 = 3'b001;
defparam sdpx9b_inst_12.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_13 (
    .DO({sdpx9b_inst_13_dout_w[26:0],sdpx9b_inst_13_dout[26:18]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[26:18]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_13.READ_MODE = 1'b0;
defparam sdpx9b_inst_13.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_13.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_13.BLK_SEL_0 = 3'b000;
defparam sdpx9b_inst_13.BLK_SEL_1 = 3'b000;
defparam sdpx9b_inst_13.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_14 (
    .DO({sdpx9b_inst_14_dout_w[26:0],sdpx9b_inst_14_dout[26:18]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[26:18]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_14.READ_MODE = 1'b0;
defparam sdpx9b_inst_14.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_14.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_14.BLK_SEL_0 = 3'b001;
defparam sdpx9b_inst_14.BLK_SEL_1 = 3'b001;
defparam sdpx9b_inst_14.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_15 (
    .DO({sdpx9b_inst_15_dout_w[26:0],sdpx9b_inst_15_dout[26:18]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[26:18]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_15.READ_MODE = 1'b0;
defparam sdpx9b_inst_15.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_15.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_15.BLK_SEL_0 = 3'b010;
defparam sdpx9b_inst_15.BLK_SEL_1 = 3'b010;
defparam sdpx9b_inst_15.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_16 (
    .DO({sdpx9b_inst_16_dout_w[26:0],sdpx9b_inst_16_dout[26:18]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[26:18]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_16.READ_MODE = 1'b0;
defparam sdpx9b_inst_16.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_16.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_16.BLK_SEL_0 = 3'b011;
defparam sdpx9b_inst_16.BLK_SEL_1 = 3'b011;
defparam sdpx9b_inst_16.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_17 (
    .DO({sdpx9b_inst_17_dout_w[26:0],sdpx9b_inst_17_dout[35:27]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[35:27]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_17.READ_MODE = 1'b0;
defparam sdpx9b_inst_17.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_17.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_17.BLK_SEL_0 = 3'b000;
defparam sdpx9b_inst_17.BLK_SEL_1 = 3'b000;
defparam sdpx9b_inst_17.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_18 (
    .DO({sdpx9b_inst_18_dout_w[26:0],sdpx9b_inst_18_dout[35:27]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[35:27]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_18.READ_MODE = 1'b0;
defparam sdpx9b_inst_18.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_18.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_18.BLK_SEL_0 = 3'b001;
defparam sdpx9b_inst_18.BLK_SEL_1 = 3'b001;
defparam sdpx9b_inst_18.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_19 (
    .DO({sdpx9b_inst_19_dout_w[26:0],sdpx9b_inst_19_dout[35:27]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[35:27]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_19.READ_MODE = 1'b0;
defparam sdpx9b_inst_19.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_19.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_19.BLK_SEL_0 = 3'b010;
defparam sdpx9b_inst_19.BLK_SEL_1 = 3'b010;
defparam sdpx9b_inst_19.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_20 (
    .DO({sdpx9b_inst_20_dout_w[26:0],sdpx9b_inst_20_dout[35:27]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[35:27]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_20.READ_MODE = 1'b0;
defparam sdpx9b_inst_20.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_20.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_20.BLK_SEL_0 = 3'b011;
defparam sdpx9b_inst_20.BLK_SEL_1 = 3'b011;
defparam sdpx9b_inst_20.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_21 (
    .DO({sdpx9b_inst_21_dout_w[26:0],sdpx9b_inst_21_dout[26:18]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[26:18]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_21.READ_MODE = 1'b0;
defparam sdpx9b_inst_21.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_21.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_21.BLK_SEL_0 = 3'b100;
defparam sdpx9b_inst_21.BLK_SEL_1 = 3'b100;
defparam sdpx9b_inst_21.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_22 (
    .DO({sdpx9b_inst_22_dout_w[26:0],sdpx9b_inst_22_dout[26:18]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[26:18]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_22.READ_MODE = 1'b0;
defparam sdpx9b_inst_22.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_22.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_22.BLK_SEL_0 = 3'b101;
defparam sdpx9b_inst_22.BLK_SEL_1 = 3'b101;
defparam sdpx9b_inst_22.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_23 (
    .DO({sdpx9b_inst_23_dout_w[26:0],sdpx9b_inst_23_dout[35:27]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[35:27]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_23.READ_MODE = 1'b0;
defparam sdpx9b_inst_23.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_23.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_23.BLK_SEL_0 = 3'b100;
defparam sdpx9b_inst_23.BLK_SEL_1 = 3'b100;
defparam sdpx9b_inst_23.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_24 (
    .DO({sdpx9b_inst_24_dout_w[26:0],sdpx9b_inst_24_dout[35:27]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({ada[13],ada[12],ada[11]}),
    .BLKSELB({adb[13],adb[12],adb[11]}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[35:27]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_24.READ_MODE = 1'b0;
defparam sdpx9b_inst_24.BIT_WIDTH_0 = 9;
defparam sdpx9b_inst_24.BIT_WIDTH_1 = 9;
defparam sdpx9b_inst_24.BLK_SEL_0 = 3'b101;
defparam sdpx9b_inst_24.BLK_SEL_1 = 3'b101;
defparam sdpx9b_inst_24.RESET_MODE = "SYNC";

SDPX9B sdpx9b_inst_25 (
    .DO({sdpx9b_inst_25_dout_w[17:0],sdpx9b_inst_25_dout[35:18]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_0}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_1}),
    .ADA({ada[9:0],gw_gnd,gw_gnd,gw_vcc,gw_vcc}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[35:18]}),
    .ADB({adb[9:0],gw_gnd,gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpx9b_inst_25.READ_MODE = 1'b0;
defparam sdpx9b_inst_25.BIT_WIDTH_0 = 18;
defparam sdpx9b_inst_25.BIT_WIDTH_1 = 18;
defparam sdpx9b_inst_25.BLK_SEL_0 = 3'b001;
defparam sdpx9b_inst_25.BLK_SEL_1 = 3'b001;
defparam sdpx9b_inst_25.RESET_MODE = "SYNC";

DFFE dff_inst_0 (
  .Q(dff_q_0),
  .D(adb[13]),
  .CLK(clkb),
  .CE(ceb)
);
DFFE dff_inst_1 (
  .Q(dff_q_1),
  .D(adb[12]),
  .CLK(clkb),
  .CE(ceb)
);
DFFE dff_inst_2 (
  .Q(dff_q_2),
  .D(adb[11]),
  .CLK(clkb),
  .CE(ceb)
);
MUX2 mux_inst_7 (
  .O(mux_o_7),
  .I0(sdpx9b_inst_0_dout[0]),
  .I1(sdpx9b_inst_1_dout[0]),
  .S0(dff_q_2)
);
MUX2 mux_inst_8 (
  .O(mux_o_8),
  .I0(sdpx9b_inst_2_dout[0]),
  .I1(sdpx9b_inst_3_dout[0]),
  .S0(dff_q_2)
);
MUX2 mux_inst_9 (
  .O(mux_o_9),
  .I0(sdpx9b_inst_8_dout[0]),
  .I1(sdpx9b_inst_9_dout[0]),
  .S0(dff_q_2)
);
MUX2 mux_inst_11 (
  .O(mux_o_11),
  .I0(mux_o_7),
  .I1(mux_o_8),
  .S0(dff_q_1)
);
MUX2 mux_inst_12 (
  .O(mux_o_12),
  .I0(mux_o_9),
  .I1(sdpx9b_inst_12_dout[0]),
  .S0(dff_q_1)
);
MUX2 mux_inst_13 (
  .O(dout[0]),
  .I0(mux_o_11),
  .I1(mux_o_12),
  .S0(dff_q_0)
);
MUX2 mux_inst_21 (
  .O(mux_o_21),
  .I0(sdpx9b_inst_0_dout[1]),
  .I1(sdpx9b_inst_1_dout[1]),
  .S0(dff_q_2)
);
MUX2 mux_inst_22 (
  .O(mux_o_22),
  .I0(sdpx9b_inst_2_dout[1]),
  .I1(sdpx9b_inst_3_dout[1]),
  .S0(dff_q_2)
);
MUX2 mux_inst_23 (
  .O(mux_o_23),
  .I0(sdpx9b_inst_8_dout[1]),
  .I1(sdpx9b_inst_9_dout[1]),
  .S0(dff_q_2)
);
MUX2 mux_inst_25 (
  .O(mux_o_25),
  .I0(mux_o_21),
  .I1(mux_o_22),
  .S0(dff_q_1)
);
MUX2 mux_inst_26 (
  .O(mux_o_26),
  .I0(mux_o_23),
  .I1(sdpx9b_inst_12_dout[1]),
  .S0(dff_q_1)
);
MUX2 mux_inst_27 (
  .O(dout[1]),
  .I0(mux_o_25),
  .I1(mux_o_26),
  .S0(dff_q_0)
);
MUX2 mux_inst_35 (
  .O(mux_o_35),
  .I0(sdpx9b_inst_0_dout[2]),
  .I1(sdpx9b_inst_1_dout[2]),
  .S0(dff_q_2)
);
MUX2 mux_inst_36 (
  .O(mux_o_36),
  .I0(sdpx9b_inst_2_dout[2]),
  .I1(sdpx9b_inst_3_dout[2]),
  .S0(dff_q_2)
);
MUX2 mux_inst_37 (
  .O(mux_o_37),
  .I0(sdpx9b_inst_8_dout[2]),
  .I1(sdpx9b_inst_9_dout[2]),
  .S0(dff_q_2)
);
MUX2 mux_inst_39 (
  .O(mux_o_39),
  .I0(mux_o_35),
  .I1(mux_o_36),
  .S0(dff_q_1)
);
MUX2 mux_inst_40 (
  .O(mux_o_40),
  .I0(mux_o_37),
  .I1(sdpx9b_inst_12_dout[2]),
  .S0(dff_q_1)
);
MUX2 mux_inst_41 (
  .O(dout[2]),
  .I0(mux_o_39),
  .I1(mux_o_40),
  .S0(dff_q_0)
);
MUX2 mux_inst_49 (
  .O(mux_o_49),
  .I0(sdpx9b_inst_0_dout[3]),
  .I1(sdpx9b_inst_1_dout[3]),
  .S0(dff_q_2)
);
MUX2 mux_inst_50 (
  .O(mux_o_50),
  .I0(sdpx9b_inst_2_dout[3]),
  .I1(sdpx9b_inst_3_dout[3]),
  .S0(dff_q_2)
);
MUX2 mux_inst_51 (
  .O(mux_o_51),
  .I0(sdpx9b_inst_8_dout[3]),
  .I1(sdpx9b_inst_9_dout[3]),
  .S0(dff_q_2)
);
MUX2 mux_inst_53 (
  .O(mux_o_53),
  .I0(mux_o_49),
  .I1(mux_o_50),
  .S0(dff_q_1)
);
MUX2 mux_inst_54 (
  .O(mux_o_54),
  .I0(mux_o_51),
  .I1(sdpx9b_inst_12_dout[3]),
  .S0(dff_q_1)
);
MUX2 mux_inst_55 (
  .O(dout[3]),
  .I0(mux_o_53),
  .I1(mux_o_54),
  .S0(dff_q_0)
);
MUX2 mux_inst_63 (
  .O(mux_o_63),
  .I0(sdpx9b_inst_0_dout[4]),
  .I1(sdpx9b_inst_1_dout[4]),
  .S0(dff_q_2)
);
MUX2 mux_inst_64 (
  .O(mux_o_64),
  .I0(sdpx9b_inst_2_dout[4]),
  .I1(sdpx9b_inst_3_dout[4]),
  .S0(dff_q_2)
);
MUX2 mux_inst_65 (
  .O(mux_o_65),
  .I0(sdpx9b_inst_8_dout[4]),
  .I1(sdpx9b_inst_9_dout[4]),
  .S0(dff_q_2)
);
MUX2 mux_inst_67 (
  .O(mux_o_67),
  .I0(mux_o_63),
  .I1(mux_o_64),
  .S0(dff_q_1)
);
MUX2 mux_inst_68 (
  .O(mux_o_68),
  .I0(mux_o_65),
  .I1(sdpx9b_inst_12_dout[4]),
  .S0(dff_q_1)
);
MUX2 mux_inst_69 (
  .O(dout[4]),
  .I0(mux_o_67),
  .I1(mux_o_68),
  .S0(dff_q_0)
);
MUX2 mux_inst_77 (
  .O(mux_o_77),
  .I0(sdpx9b_inst_0_dout[5]),
  .I1(sdpx9b_inst_1_dout[5]),
  .S0(dff_q_2)
);
MUX2 mux_inst_78 (
  .O(mux_o_78),
  .I0(sdpx9b_inst_2_dout[5]),
  .I1(sdpx9b_inst_3_dout[5]),
  .S0(dff_q_2)
);
MUX2 mux_inst_79 (
  .O(mux_o_79),
  .I0(sdpx9b_inst_8_dout[5]),
  .I1(sdpx9b_inst_9_dout[5]),
  .S0(dff_q_2)
);
MUX2 mux_inst_81 (
  .O(mux_o_81),
  .I0(mux_o_77),
  .I1(mux_o_78),
  .S0(dff_q_1)
);
MUX2 mux_inst_82 (
  .O(mux_o_82),
  .I0(mux_o_79),
  .I1(sdpx9b_inst_12_dout[5]),
  .S0(dff_q_1)
);
MUX2 mux_inst_83 (
  .O(dout[5]),
  .I0(mux_o_81),
  .I1(mux_o_82),
  .S0(dff_q_0)
);
MUX2 mux_inst_91 (
  .O(mux_o_91),
  .I0(sdpx9b_inst_0_dout[6]),
  .I1(sdpx9b_inst_1_dout[6]),
  .S0(dff_q_2)
);
MUX2 mux_inst_92 (
  .O(mux_o_92),
  .I0(sdpx9b_inst_2_dout[6]),
  .I1(sdpx9b_inst_3_dout[6]),
  .S0(dff_q_2)
);
MUX2 mux_inst_93 (
  .O(mux_o_93),
  .I0(sdpx9b_inst_8_dout[6]),
  .I1(sdpx9b_inst_9_dout[6]),
  .S0(dff_q_2)
);
MUX2 mux_inst_95 (
  .O(mux_o_95),
  .I0(mux_o_91),
  .I1(mux_o_92),
  .S0(dff_q_1)
);
MUX2 mux_inst_96 (
  .O(mux_o_96),
  .I0(mux_o_93),
  .I1(sdpx9b_inst_12_dout[6]),
  .S0(dff_q_1)
);
MUX2 mux_inst_97 (
  .O(dout[6]),
  .I0(mux_o_95),
  .I1(mux_o_96),
  .S0(dff_q_0)
);
MUX2 mux_inst_105 (
  .O(mux_o_105),
  .I0(sdpx9b_inst_0_dout[7]),
  .I1(sdpx9b_inst_1_dout[7]),
  .S0(dff_q_2)
);
MUX2 mux_inst_106 (
  .O(mux_o_106),
  .I0(sdpx9b_inst_2_dout[7]),
  .I1(sdpx9b_inst_3_dout[7]),
  .S0(dff_q_2)
);
MUX2 mux_inst_107 (
  .O(mux_o_107),
  .I0(sdpx9b_inst_8_dout[7]),
  .I1(sdpx9b_inst_9_dout[7]),
  .S0(dff_q_2)
);
MUX2 mux_inst_109 (
  .O(mux_o_109),
  .I0(mux_o_105),
  .I1(mux_o_106),
  .S0(dff_q_1)
);
MUX2 mux_inst_110 (
  .O(mux_o_110),
  .I0(mux_o_107),
  .I1(sdpx9b_inst_12_dout[7]),
  .S0(dff_q_1)
);
MUX2 mux_inst_111 (
  .O(dout[7]),
  .I0(mux_o_109),
  .I1(mux_o_110),
  .S0(dff_q_0)
);
MUX2 mux_inst_119 (
  .O(mux_o_119),
  .I0(sdpx9b_inst_0_dout[8]),
  .I1(sdpx9b_inst_1_dout[8]),
  .S0(dff_q_2)
);
MUX2 mux_inst_120 (
  .O(mux_o_120),
  .I0(sdpx9b_inst_2_dout[8]),
  .I1(sdpx9b_inst_3_dout[8]),
  .S0(dff_q_2)
);
MUX2 mux_inst_121 (
  .O(mux_o_121),
  .I0(sdpx9b_inst_8_dout[8]),
  .I1(sdpx9b_inst_9_dout[8]),
  .S0(dff_q_2)
);
MUX2 mux_inst_123 (
  .O(mux_o_123),
  .I0(mux_o_119),
  .I1(mux_o_120),
  .S0(dff_q_1)
);
MUX2 mux_inst_124 (
  .O(mux_o_124),
  .I0(mux_o_121),
  .I1(sdpx9b_inst_12_dout[8]),
  .S0(dff_q_1)
);
MUX2 mux_inst_125 (
  .O(dout[8]),
  .I0(mux_o_123),
  .I1(mux_o_124),
  .S0(dff_q_0)
);
MUX2 mux_inst_133 (
  .O(mux_o_133),
  .I0(sdpx9b_inst_4_dout[9]),
  .I1(sdpx9b_inst_5_dout[9]),
  .S0(dff_q_2)
);
MUX2 mux_inst_134 (
  .O(mux_o_134),
  .I0(sdpx9b_inst_6_dout[9]),
  .I1(sdpx9b_inst_7_dout[9]),
  .S0(dff_q_2)
);
MUX2 mux_inst_135 (
  .O(mux_o_135),
  .I0(sdpx9b_inst_10_dout[9]),
  .I1(sdpx9b_inst_11_dout[9]),
  .S0(dff_q_2)
);
MUX2 mux_inst_137 (
  .O(mux_o_137),
  .I0(mux_o_133),
  .I1(mux_o_134),
  .S0(dff_q_1)
);
MUX2 mux_inst_138 (
  .O(mux_o_138),
  .I0(mux_o_135),
  .I1(sdpx9b_inst_12_dout[9]),
  .S0(dff_q_1)
);
MUX2 mux_inst_139 (
  .O(dout[9]),
  .I0(mux_o_137),
  .I1(mux_o_138),
  .S0(dff_q_0)
);
MUX2 mux_inst_147 (
  .O(mux_o_147),
  .I0(sdpx9b_inst_4_dout[10]),
  .I1(sdpx9b_inst_5_dout[10]),
  .S0(dff_q_2)
);
MUX2 mux_inst_148 (
  .O(mux_o_148),
  .I0(sdpx9b_inst_6_dout[10]),
  .I1(sdpx9b_inst_7_dout[10]),
  .S0(dff_q_2)
);
MUX2 mux_inst_149 (
  .O(mux_o_149),
  .I0(sdpx9b_inst_10_dout[10]),
  .I1(sdpx9b_inst_11_dout[10]),
  .S0(dff_q_2)
);
MUX2 mux_inst_151 (
  .O(mux_o_151),
  .I0(mux_o_147),
  .I1(mux_o_148),
  .S0(dff_q_1)
);
MUX2 mux_inst_152 (
  .O(mux_o_152),
  .I0(mux_o_149),
  .I1(sdpx9b_inst_12_dout[10]),
  .S0(dff_q_1)
);
MUX2 mux_inst_153 (
  .O(dout[10]),
  .I0(mux_o_151),
  .I1(mux_o_152),
  .S0(dff_q_0)
);
MUX2 mux_inst_161 (
  .O(mux_o_161),
  .I0(sdpx9b_inst_4_dout[11]),
  .I1(sdpx9b_inst_5_dout[11]),
  .S0(dff_q_2)
);
MUX2 mux_inst_162 (
  .O(mux_o_162),
  .I0(sdpx9b_inst_6_dout[11]),
  .I1(sdpx9b_inst_7_dout[11]),
  .S0(dff_q_2)
);
MUX2 mux_inst_163 (
  .O(mux_o_163),
  .I0(sdpx9b_inst_10_dout[11]),
  .I1(sdpx9b_inst_11_dout[11]),
  .S0(dff_q_2)
);
MUX2 mux_inst_165 (
  .O(mux_o_165),
  .I0(mux_o_161),
  .I1(mux_o_162),
  .S0(dff_q_1)
);
MUX2 mux_inst_166 (
  .O(mux_o_166),
  .I0(mux_o_163),
  .I1(sdpx9b_inst_12_dout[11]),
  .S0(dff_q_1)
);
MUX2 mux_inst_167 (
  .O(dout[11]),
  .I0(mux_o_165),
  .I1(mux_o_166),
  .S0(dff_q_0)
);
MUX2 mux_inst_175 (
  .O(mux_o_175),
  .I0(sdpx9b_inst_4_dout[12]),
  .I1(sdpx9b_inst_5_dout[12]),
  .S0(dff_q_2)
);
MUX2 mux_inst_176 (
  .O(mux_o_176),
  .I0(sdpx9b_inst_6_dout[12]),
  .I1(sdpx9b_inst_7_dout[12]),
  .S0(dff_q_2)
);
MUX2 mux_inst_177 (
  .O(mux_o_177),
  .I0(sdpx9b_inst_10_dout[12]),
  .I1(sdpx9b_inst_11_dout[12]),
  .S0(dff_q_2)
);
MUX2 mux_inst_179 (
  .O(mux_o_179),
  .I0(mux_o_175),
  .I1(mux_o_176),
  .S0(dff_q_1)
);
MUX2 mux_inst_180 (
  .O(mux_o_180),
  .I0(mux_o_177),
  .I1(sdpx9b_inst_12_dout[12]),
  .S0(dff_q_1)
);
MUX2 mux_inst_181 (
  .O(dout[12]),
  .I0(mux_o_179),
  .I1(mux_o_180),
  .S0(dff_q_0)
);
MUX2 mux_inst_189 (
  .O(mux_o_189),
  .I0(sdpx9b_inst_4_dout[13]),
  .I1(sdpx9b_inst_5_dout[13]),
  .S0(dff_q_2)
);
MUX2 mux_inst_190 (
  .O(mux_o_190),
  .I0(sdpx9b_inst_6_dout[13]),
  .I1(sdpx9b_inst_7_dout[13]),
  .S0(dff_q_2)
);
MUX2 mux_inst_191 (
  .O(mux_o_191),
  .I0(sdpx9b_inst_10_dout[13]),
  .I1(sdpx9b_inst_11_dout[13]),
  .S0(dff_q_2)
);
MUX2 mux_inst_193 (
  .O(mux_o_193),
  .I0(mux_o_189),
  .I1(mux_o_190),
  .S0(dff_q_1)
);
MUX2 mux_inst_194 (
  .O(mux_o_194),
  .I0(mux_o_191),
  .I1(sdpx9b_inst_12_dout[13]),
  .S0(dff_q_1)
);
MUX2 mux_inst_195 (
  .O(dout[13]),
  .I0(mux_o_193),
  .I1(mux_o_194),
  .S0(dff_q_0)
);
MUX2 mux_inst_203 (
  .O(mux_o_203),
  .I0(sdpx9b_inst_4_dout[14]),
  .I1(sdpx9b_inst_5_dout[14]),
  .S0(dff_q_2)
);
MUX2 mux_inst_204 (
  .O(mux_o_204),
  .I0(sdpx9b_inst_6_dout[14]),
  .I1(sdpx9b_inst_7_dout[14]),
  .S0(dff_q_2)
);
MUX2 mux_inst_205 (
  .O(mux_o_205),
  .I0(sdpx9b_inst_10_dout[14]),
  .I1(sdpx9b_inst_11_dout[14]),
  .S0(dff_q_2)
);
MUX2 mux_inst_207 (
  .O(mux_o_207),
  .I0(mux_o_203),
  .I1(mux_o_204),
  .S0(dff_q_1)
);
MUX2 mux_inst_208 (
  .O(mux_o_208),
  .I0(mux_o_205),
  .I1(sdpx9b_inst_12_dout[14]),
  .S0(dff_q_1)
);
MUX2 mux_inst_209 (
  .O(dout[14]),
  .I0(mux_o_207),
  .I1(mux_o_208),
  .S0(dff_q_0)
);
MUX2 mux_inst_217 (
  .O(mux_o_217),
  .I0(sdpx9b_inst_4_dout[15]),
  .I1(sdpx9b_inst_5_dout[15]),
  .S0(dff_q_2)
);
MUX2 mux_inst_218 (
  .O(mux_o_218),
  .I0(sdpx9b_inst_6_dout[15]),
  .I1(sdpx9b_inst_7_dout[15]),
  .S0(dff_q_2)
);
MUX2 mux_inst_219 (
  .O(mux_o_219),
  .I0(sdpx9b_inst_10_dout[15]),
  .I1(sdpx9b_inst_11_dout[15]),
  .S0(dff_q_2)
);
MUX2 mux_inst_221 (
  .O(mux_o_221),
  .I0(mux_o_217),
  .I1(mux_o_218),
  .S0(dff_q_1)
);
MUX2 mux_inst_222 (
  .O(mux_o_222),
  .I0(mux_o_219),
  .I1(sdpx9b_inst_12_dout[15]),
  .S0(dff_q_1)
);
MUX2 mux_inst_223 (
  .O(dout[15]),
  .I0(mux_o_221),
  .I1(mux_o_222),
  .S0(dff_q_0)
);
MUX2 mux_inst_231 (
  .O(mux_o_231),
  .I0(sdpx9b_inst_4_dout[16]),
  .I1(sdpx9b_inst_5_dout[16]),
  .S0(dff_q_2)
);
MUX2 mux_inst_232 (
  .O(mux_o_232),
  .I0(sdpx9b_inst_6_dout[16]),
  .I1(sdpx9b_inst_7_dout[16]),
  .S0(dff_q_2)
);
MUX2 mux_inst_233 (
  .O(mux_o_233),
  .I0(sdpx9b_inst_10_dout[16]),
  .I1(sdpx9b_inst_11_dout[16]),
  .S0(dff_q_2)
);
MUX2 mux_inst_235 (
  .O(mux_o_235),
  .I0(mux_o_231),
  .I1(mux_o_232),
  .S0(dff_q_1)
);
MUX2 mux_inst_236 (
  .O(mux_o_236),
  .I0(mux_o_233),
  .I1(sdpx9b_inst_12_dout[16]),
  .S0(dff_q_1)
);
MUX2 mux_inst_237 (
  .O(dout[16]),
  .I0(mux_o_235),
  .I1(mux_o_236),
  .S0(dff_q_0)
);
MUX2 mux_inst_245 (
  .O(mux_o_245),
  .I0(sdpx9b_inst_4_dout[17]),
  .I1(sdpx9b_inst_5_dout[17]),
  .S0(dff_q_2)
);
MUX2 mux_inst_246 (
  .O(mux_o_246),
  .I0(sdpx9b_inst_6_dout[17]),
  .I1(sdpx9b_inst_7_dout[17]),
  .S0(dff_q_2)
);
MUX2 mux_inst_247 (
  .O(mux_o_247),
  .I0(sdpx9b_inst_10_dout[17]),
  .I1(sdpx9b_inst_11_dout[17]),
  .S0(dff_q_2)
);
MUX2 mux_inst_249 (
  .O(mux_o_249),
  .I0(mux_o_245),
  .I1(mux_o_246),
  .S0(dff_q_1)
);
MUX2 mux_inst_250 (
  .O(mux_o_250),
  .I0(mux_o_247),
  .I1(sdpx9b_inst_12_dout[17]),
  .S0(dff_q_1)
);
MUX2 mux_inst_251 (
  .O(dout[17]),
  .I0(mux_o_249),
  .I1(mux_o_250),
  .S0(dff_q_0)
);
MUX2 mux_inst_259 (
  .O(mux_o_259),
  .I0(sdpx9b_inst_13_dout[18]),
  .I1(sdpx9b_inst_14_dout[18]),
  .S0(dff_q_2)
);
MUX2 mux_inst_260 (
  .O(mux_o_260),
  .I0(sdpx9b_inst_15_dout[18]),
  .I1(sdpx9b_inst_16_dout[18]),
  .S0(dff_q_2)
);
MUX2 mux_inst_261 (
  .O(mux_o_261),
  .I0(sdpx9b_inst_21_dout[18]),
  .I1(sdpx9b_inst_22_dout[18]),
  .S0(dff_q_2)
);
MUX2 mux_inst_263 (
  .O(mux_o_263),
  .I0(mux_o_259),
  .I1(mux_o_260),
  .S0(dff_q_1)
);
MUX2 mux_inst_264 (
  .O(mux_o_264),
  .I0(mux_o_261),
  .I1(sdpx9b_inst_25_dout[18]),
  .S0(dff_q_1)
);
MUX2 mux_inst_265 (
  .O(dout[18]),
  .I0(mux_o_263),
  .I1(mux_o_264),
  .S0(dff_q_0)
);
MUX2 mux_inst_273 (
  .O(mux_o_273),
  .I0(sdpx9b_inst_13_dout[19]),
  .I1(sdpx9b_inst_14_dout[19]),
  .S0(dff_q_2)
);
MUX2 mux_inst_274 (
  .O(mux_o_274),
  .I0(sdpx9b_inst_15_dout[19]),
  .I1(sdpx9b_inst_16_dout[19]),
  .S0(dff_q_2)
);
MUX2 mux_inst_275 (
  .O(mux_o_275),
  .I0(sdpx9b_inst_21_dout[19]),
  .I1(sdpx9b_inst_22_dout[19]),
  .S0(dff_q_2)
);
MUX2 mux_inst_277 (
  .O(mux_o_277),
  .I0(mux_o_273),
  .I1(mux_o_274),
  .S0(dff_q_1)
);
MUX2 mux_inst_278 (
  .O(mux_o_278),
  .I0(mux_o_275),
  .I1(sdpx9b_inst_25_dout[19]),
  .S0(dff_q_1)
);
MUX2 mux_inst_279 (
  .O(dout[19]),
  .I0(mux_o_277),
  .I1(mux_o_278),
  .S0(dff_q_0)
);
MUX2 mux_inst_287 (
  .O(mux_o_287),
  .I0(sdpx9b_inst_13_dout[20]),
  .I1(sdpx9b_inst_14_dout[20]),
  .S0(dff_q_2)
);
MUX2 mux_inst_288 (
  .O(mux_o_288),
  .I0(sdpx9b_inst_15_dout[20]),
  .I1(sdpx9b_inst_16_dout[20]),
  .S0(dff_q_2)
);
MUX2 mux_inst_289 (
  .O(mux_o_289),
  .I0(sdpx9b_inst_21_dout[20]),
  .I1(sdpx9b_inst_22_dout[20]),
  .S0(dff_q_2)
);
MUX2 mux_inst_291 (
  .O(mux_o_291),
  .I0(mux_o_287),
  .I1(mux_o_288),
  .S0(dff_q_1)
);
MUX2 mux_inst_292 (
  .O(mux_o_292),
  .I0(mux_o_289),
  .I1(sdpx9b_inst_25_dout[20]),
  .S0(dff_q_1)
);
MUX2 mux_inst_293 (
  .O(dout[20]),
  .I0(mux_o_291),
  .I1(mux_o_292),
  .S0(dff_q_0)
);
MUX2 mux_inst_301 (
  .O(mux_o_301),
  .I0(sdpx9b_inst_13_dout[21]),
  .I1(sdpx9b_inst_14_dout[21]),
  .S0(dff_q_2)
);
MUX2 mux_inst_302 (
  .O(mux_o_302),
  .I0(sdpx9b_inst_15_dout[21]),
  .I1(sdpx9b_inst_16_dout[21]),
  .S0(dff_q_2)
);
MUX2 mux_inst_303 (
  .O(mux_o_303),
  .I0(sdpx9b_inst_21_dout[21]),
  .I1(sdpx9b_inst_22_dout[21]),
  .S0(dff_q_2)
);
MUX2 mux_inst_305 (
  .O(mux_o_305),
  .I0(mux_o_301),
  .I1(mux_o_302),
  .S0(dff_q_1)
);
MUX2 mux_inst_306 (
  .O(mux_o_306),
  .I0(mux_o_303),
  .I1(sdpx9b_inst_25_dout[21]),
  .S0(dff_q_1)
);
MUX2 mux_inst_307 (
  .O(dout[21]),
  .I0(mux_o_305),
  .I1(mux_o_306),
  .S0(dff_q_0)
);
MUX2 mux_inst_315 (
  .O(mux_o_315),
  .I0(sdpx9b_inst_13_dout[22]),
  .I1(sdpx9b_inst_14_dout[22]),
  .S0(dff_q_2)
);
MUX2 mux_inst_316 (
  .O(mux_o_316),
  .I0(sdpx9b_inst_15_dout[22]),
  .I1(sdpx9b_inst_16_dout[22]),
  .S0(dff_q_2)
);
MUX2 mux_inst_317 (
  .O(mux_o_317),
  .I0(sdpx9b_inst_21_dout[22]),
  .I1(sdpx9b_inst_22_dout[22]),
  .S0(dff_q_2)
);
MUX2 mux_inst_319 (
  .O(mux_o_319),
  .I0(mux_o_315),
  .I1(mux_o_316),
  .S0(dff_q_1)
);
MUX2 mux_inst_320 (
  .O(mux_o_320),
  .I0(mux_o_317),
  .I1(sdpx9b_inst_25_dout[22]),
  .S0(dff_q_1)
);
MUX2 mux_inst_321 (
  .O(dout[22]),
  .I0(mux_o_319),
  .I1(mux_o_320),
  .S0(dff_q_0)
);
MUX2 mux_inst_329 (
  .O(mux_o_329),
  .I0(sdpx9b_inst_13_dout[23]),
  .I1(sdpx9b_inst_14_dout[23]),
  .S0(dff_q_2)
);
MUX2 mux_inst_330 (
  .O(mux_o_330),
  .I0(sdpx9b_inst_15_dout[23]),
  .I1(sdpx9b_inst_16_dout[23]),
  .S0(dff_q_2)
);
MUX2 mux_inst_331 (
  .O(mux_o_331),
  .I0(sdpx9b_inst_21_dout[23]),
  .I1(sdpx9b_inst_22_dout[23]),
  .S0(dff_q_2)
);
MUX2 mux_inst_333 (
  .O(mux_o_333),
  .I0(mux_o_329),
  .I1(mux_o_330),
  .S0(dff_q_1)
);
MUX2 mux_inst_334 (
  .O(mux_o_334),
  .I0(mux_o_331),
  .I1(sdpx9b_inst_25_dout[23]),
  .S0(dff_q_1)
);
MUX2 mux_inst_335 (
  .O(dout[23]),
  .I0(mux_o_333),
  .I1(mux_o_334),
  .S0(dff_q_0)
);
MUX2 mux_inst_343 (
  .O(mux_o_343),
  .I0(sdpx9b_inst_13_dout[24]),
  .I1(sdpx9b_inst_14_dout[24]),
  .S0(dff_q_2)
);
MUX2 mux_inst_344 (
  .O(mux_o_344),
  .I0(sdpx9b_inst_15_dout[24]),
  .I1(sdpx9b_inst_16_dout[24]),
  .S0(dff_q_2)
);
MUX2 mux_inst_345 (
  .O(mux_o_345),
  .I0(sdpx9b_inst_21_dout[24]),
  .I1(sdpx9b_inst_22_dout[24]),
  .S0(dff_q_2)
);
MUX2 mux_inst_347 (
  .O(mux_o_347),
  .I0(mux_o_343),
  .I1(mux_o_344),
  .S0(dff_q_1)
);
MUX2 mux_inst_348 (
  .O(mux_o_348),
  .I0(mux_o_345),
  .I1(sdpx9b_inst_25_dout[24]),
  .S0(dff_q_1)
);
MUX2 mux_inst_349 (
  .O(dout[24]),
  .I0(mux_o_347),
  .I1(mux_o_348),
  .S0(dff_q_0)
);
MUX2 mux_inst_357 (
  .O(mux_o_357),
  .I0(sdpx9b_inst_13_dout[25]),
  .I1(sdpx9b_inst_14_dout[25]),
  .S0(dff_q_2)
);
MUX2 mux_inst_358 (
  .O(mux_o_358),
  .I0(sdpx9b_inst_15_dout[25]),
  .I1(sdpx9b_inst_16_dout[25]),
  .S0(dff_q_2)
);
MUX2 mux_inst_359 (
  .O(mux_o_359),
  .I0(sdpx9b_inst_21_dout[25]),
  .I1(sdpx9b_inst_22_dout[25]),
  .S0(dff_q_2)
);
MUX2 mux_inst_361 (
  .O(mux_o_361),
  .I0(mux_o_357),
  .I1(mux_o_358),
  .S0(dff_q_1)
);
MUX2 mux_inst_362 (
  .O(mux_o_362),
  .I0(mux_o_359),
  .I1(sdpx9b_inst_25_dout[25]),
  .S0(dff_q_1)
);
MUX2 mux_inst_363 (
  .O(dout[25]),
  .I0(mux_o_361),
  .I1(mux_o_362),
  .S0(dff_q_0)
);
MUX2 mux_inst_371 (
  .O(mux_o_371),
  .I0(sdpx9b_inst_13_dout[26]),
  .I1(sdpx9b_inst_14_dout[26]),
  .S0(dff_q_2)
);
MUX2 mux_inst_372 (
  .O(mux_o_372),
  .I0(sdpx9b_inst_15_dout[26]),
  .I1(sdpx9b_inst_16_dout[26]),
  .S0(dff_q_2)
);
MUX2 mux_inst_373 (
  .O(mux_o_373),
  .I0(sdpx9b_inst_21_dout[26]),
  .I1(sdpx9b_inst_22_dout[26]),
  .S0(dff_q_2)
);
MUX2 mux_inst_375 (
  .O(mux_o_375),
  .I0(mux_o_371),
  .I1(mux_o_372),
  .S0(dff_q_1)
);
MUX2 mux_inst_376 (
  .O(mux_o_376),
  .I0(mux_o_373),
  .I1(sdpx9b_inst_25_dout[26]),
  .S0(dff_q_1)
);
MUX2 mux_inst_377 (
  .O(dout[26]),
  .I0(mux_o_375),
  .I1(mux_o_376),
  .S0(dff_q_0)
);
MUX2 mux_inst_385 (
  .O(mux_o_385),
  .I0(sdpx9b_inst_17_dout[27]),
  .I1(sdpx9b_inst_18_dout[27]),
  .S0(dff_q_2)
);
MUX2 mux_inst_386 (
  .O(mux_o_386),
  .I0(sdpx9b_inst_19_dout[27]),
  .I1(sdpx9b_inst_20_dout[27]),
  .S0(dff_q_2)
);
MUX2 mux_inst_387 (
  .O(mux_o_387),
  .I0(sdpx9b_inst_23_dout[27]),
  .I1(sdpx9b_inst_24_dout[27]),
  .S0(dff_q_2)
);
MUX2 mux_inst_389 (
  .O(mux_o_389),
  .I0(mux_o_385),
  .I1(mux_o_386),
  .S0(dff_q_1)
);
MUX2 mux_inst_390 (
  .O(mux_o_390),
  .I0(mux_o_387),
  .I1(sdpx9b_inst_25_dout[27]),
  .S0(dff_q_1)
);
MUX2 mux_inst_391 (
  .O(dout[27]),
  .I0(mux_o_389),
  .I1(mux_o_390),
  .S0(dff_q_0)
);
MUX2 mux_inst_399 (
  .O(mux_o_399),
  .I0(sdpx9b_inst_17_dout[28]),
  .I1(sdpx9b_inst_18_dout[28]),
  .S0(dff_q_2)
);
MUX2 mux_inst_400 (
  .O(mux_o_400),
  .I0(sdpx9b_inst_19_dout[28]),
  .I1(sdpx9b_inst_20_dout[28]),
  .S0(dff_q_2)
);
MUX2 mux_inst_401 (
  .O(mux_o_401),
  .I0(sdpx9b_inst_23_dout[28]),
  .I1(sdpx9b_inst_24_dout[28]),
  .S0(dff_q_2)
);
MUX2 mux_inst_403 (
  .O(mux_o_403),
  .I0(mux_o_399),
  .I1(mux_o_400),
  .S0(dff_q_1)
);
MUX2 mux_inst_404 (
  .O(mux_o_404),
  .I0(mux_o_401),
  .I1(sdpx9b_inst_25_dout[28]),
  .S0(dff_q_1)
);
MUX2 mux_inst_405 (
  .O(dout[28]),
  .I0(mux_o_403),
  .I1(mux_o_404),
  .S0(dff_q_0)
);
MUX2 mux_inst_413 (
  .O(mux_o_413),
  .I0(sdpx9b_inst_17_dout[29]),
  .I1(sdpx9b_inst_18_dout[29]),
  .S0(dff_q_2)
);
MUX2 mux_inst_414 (
  .O(mux_o_414),
  .I0(sdpx9b_inst_19_dout[29]),
  .I1(sdpx9b_inst_20_dout[29]),
  .S0(dff_q_2)
);
MUX2 mux_inst_415 (
  .O(mux_o_415),
  .I0(sdpx9b_inst_23_dout[29]),
  .I1(sdpx9b_inst_24_dout[29]),
  .S0(dff_q_2)
);
MUX2 mux_inst_417 (
  .O(mux_o_417),
  .I0(mux_o_413),
  .I1(mux_o_414),
  .S0(dff_q_1)
);
MUX2 mux_inst_418 (
  .O(mux_o_418),
  .I0(mux_o_415),
  .I1(sdpx9b_inst_25_dout[29]),
  .S0(dff_q_1)
);
MUX2 mux_inst_419 (
  .O(dout[29]),
  .I0(mux_o_417),
  .I1(mux_o_418),
  .S0(dff_q_0)
);
MUX2 mux_inst_427 (
  .O(mux_o_427),
  .I0(sdpx9b_inst_17_dout[30]),
  .I1(sdpx9b_inst_18_dout[30]),
  .S0(dff_q_2)
);
MUX2 mux_inst_428 (
  .O(mux_o_428),
  .I0(sdpx9b_inst_19_dout[30]),
  .I1(sdpx9b_inst_20_dout[30]),
  .S0(dff_q_2)
);
MUX2 mux_inst_429 (
  .O(mux_o_429),
  .I0(sdpx9b_inst_23_dout[30]),
  .I1(sdpx9b_inst_24_dout[30]),
  .S0(dff_q_2)
);
MUX2 mux_inst_431 (
  .O(mux_o_431),
  .I0(mux_o_427),
  .I1(mux_o_428),
  .S0(dff_q_1)
);
MUX2 mux_inst_432 (
  .O(mux_o_432),
  .I0(mux_o_429),
  .I1(sdpx9b_inst_25_dout[30]),
  .S0(dff_q_1)
);
MUX2 mux_inst_433 (
  .O(dout[30]),
  .I0(mux_o_431),
  .I1(mux_o_432),
  .S0(dff_q_0)
);
MUX2 mux_inst_441 (
  .O(mux_o_441),
  .I0(sdpx9b_inst_17_dout[31]),
  .I1(sdpx9b_inst_18_dout[31]),
  .S0(dff_q_2)
);
MUX2 mux_inst_442 (
  .O(mux_o_442),
  .I0(sdpx9b_inst_19_dout[31]),
  .I1(sdpx9b_inst_20_dout[31]),
  .S0(dff_q_2)
);
MUX2 mux_inst_443 (
  .O(mux_o_443),
  .I0(sdpx9b_inst_23_dout[31]),
  .I1(sdpx9b_inst_24_dout[31]),
  .S0(dff_q_2)
);
MUX2 mux_inst_445 (
  .O(mux_o_445),
  .I0(mux_o_441),
  .I1(mux_o_442),
  .S0(dff_q_1)
);
MUX2 mux_inst_446 (
  .O(mux_o_446),
  .I0(mux_o_443),
  .I1(sdpx9b_inst_25_dout[31]),
  .S0(dff_q_1)
);
MUX2 mux_inst_447 (
  .O(dout[31]),
  .I0(mux_o_445),
  .I1(mux_o_446),
  .S0(dff_q_0)
);
MUX2 mux_inst_455 (
  .O(mux_o_455),
  .I0(sdpx9b_inst_17_dout[32]),
  .I1(sdpx9b_inst_18_dout[32]),
  .S0(dff_q_2)
);
MUX2 mux_inst_456 (
  .O(mux_o_456),
  .I0(sdpx9b_inst_19_dout[32]),
  .I1(sdpx9b_inst_20_dout[32]),
  .S0(dff_q_2)
);
MUX2 mux_inst_457 (
  .O(mux_o_457),
  .I0(sdpx9b_inst_23_dout[32]),
  .I1(sdpx9b_inst_24_dout[32]),
  .S0(dff_q_2)
);
MUX2 mux_inst_459 (
  .O(mux_o_459),
  .I0(mux_o_455),
  .I1(mux_o_456),
  .S0(dff_q_1)
);
MUX2 mux_inst_460 (
  .O(mux_o_460),
  .I0(mux_o_457),
  .I1(sdpx9b_inst_25_dout[32]),
  .S0(dff_q_1)
);
MUX2 mux_inst_461 (
  .O(dout[32]),
  .I0(mux_o_459),
  .I1(mux_o_460),
  .S0(dff_q_0)
);
MUX2 mux_inst_469 (
  .O(mux_o_469),
  .I0(sdpx9b_inst_17_dout[33]),
  .I1(sdpx9b_inst_18_dout[33]),
  .S0(dff_q_2)
);
MUX2 mux_inst_470 (
  .O(mux_o_470),
  .I0(sdpx9b_inst_19_dout[33]),
  .I1(sdpx9b_inst_20_dout[33]),
  .S0(dff_q_2)
);
MUX2 mux_inst_471 (
  .O(mux_o_471),
  .I0(sdpx9b_inst_23_dout[33]),
  .I1(sdpx9b_inst_24_dout[33]),
  .S0(dff_q_2)
);
MUX2 mux_inst_473 (
  .O(mux_o_473),
  .I0(mux_o_469),
  .I1(mux_o_470),
  .S0(dff_q_1)
);
MUX2 mux_inst_474 (
  .O(mux_o_474),
  .I0(mux_o_471),
  .I1(sdpx9b_inst_25_dout[33]),
  .S0(dff_q_1)
);
MUX2 mux_inst_475 (
  .O(dout[33]),
  .I0(mux_o_473),
  .I1(mux_o_474),
  .S0(dff_q_0)
);
MUX2 mux_inst_483 (
  .O(mux_o_483),
  .I0(sdpx9b_inst_17_dout[34]),
  .I1(sdpx9b_inst_18_dout[34]),
  .S0(dff_q_2)
);
MUX2 mux_inst_484 (
  .O(mux_o_484),
  .I0(sdpx9b_inst_19_dout[34]),
  .I1(sdpx9b_inst_20_dout[34]),
  .S0(dff_q_2)
);
MUX2 mux_inst_485 (
  .O(mux_o_485),
  .I0(sdpx9b_inst_23_dout[34]),
  .I1(sdpx9b_inst_24_dout[34]),
  .S0(dff_q_2)
);
MUX2 mux_inst_487 (
  .O(mux_o_487),
  .I0(mux_o_483),
  .I1(mux_o_484),
  .S0(dff_q_1)
);
MUX2 mux_inst_488 (
  .O(mux_o_488),
  .I0(mux_o_485),
  .I1(sdpx9b_inst_25_dout[34]),
  .S0(dff_q_1)
);
MUX2 mux_inst_489 (
  .O(dout[34]),
  .I0(mux_o_487),
  .I1(mux_o_488),
  .S0(dff_q_0)
);
MUX2 mux_inst_497 (
  .O(mux_o_497),
  .I0(sdpx9b_inst_17_dout[35]),
  .I1(sdpx9b_inst_18_dout[35]),
  .S0(dff_q_2)
);
MUX2 mux_inst_498 (
  .O(mux_o_498),
  .I0(sdpx9b_inst_19_dout[35]),
  .I1(sdpx9b_inst_20_dout[35]),
  .S0(dff_q_2)
);
MUX2 mux_inst_499 (
  .O(mux_o_499),
  .I0(sdpx9b_inst_23_dout[35]),
  .I1(sdpx9b_inst_24_dout[35]),
  .S0(dff_q_2)
);
MUX2 mux_inst_501 (
  .O(mux_o_501),
  .I0(mux_o_497),
  .I1(mux_o_498),
  .S0(dff_q_1)
);
MUX2 mux_inst_502 (
  .O(mux_o_502),
  .I0(mux_o_499),
  .I1(sdpx9b_inst_25_dout[35]),
  .S0(dff_q_1)
);
MUX2 mux_inst_503 (
  .O(dout[35]),
  .I0(mux_o_501),
  .I1(mux_o_502),
  .S0(dff_q_0)
);
endmodule //bram_fb
