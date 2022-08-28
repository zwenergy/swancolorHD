////////////////////////////////////////////////////////////////
// Title: Top Unit for WonderSwan Color Video/Audio Capture
// Author: zwenergy
////////////////////////////////////////////////////////////////

import configPackage::*;

module topUnit
(
  input logic CLK_27MHZ,
  
  input logic dclk0,
  input logic dclk1,
  input logic hblank,
  input logic vblank,
  input logic[3:0] video0,
  input logic[3:0] video1,
  input logic[3:0] video2,
  input logic SDAT,
  input logic LRCK,
  input logic BCLK,
  

  output powerOut,
  output logic tmds_clk_p,
  output logic tmds_clk_n,
  output logic[2:0] tmds_p,
  output logic[2:0] tmds_n
);


// Create clocks.
wire pxlClk, pxlClkx5, lock, rst;
assign rst = ~lock;

// Pxl Clock x5
rPLL pll_x5 (
    .CLKOUT(pxlClkx5),
    .LOCK(lock),
    .RESET(1'b0),
    .RESET_P(1'b0),
    .CLKIN(CLK_27MHZ),
    .CLKFB(1'b0),
    .FBDSEL({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
    .IDSEL({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
    .ODSEL({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
    .PSDA({1'b0,1'b0,1'b0,1'b0}),
    .DUTYDA({1'b0,1'b0,1'b0,1'b0}),
    .FDLY({1'b0,1'b0,1'b0,1'b0})
);

defparam pll_x5.FCLKIN = "27";
defparam pll_x5.DYN_IDIV_SEL = "false";
defparam pll_x5.IDIV_SEL = IDIV_SEL_X5;
defparam pll_x5.DYN_FBDIV_SEL = "false";
defparam pll_x5.FBDIV_SEL = FBDIV_SEL_X5;
defparam pll_x5.DYN_ODIV_SEL = "false";
defparam pll_x5.ODIV_SEL = ODIV_SEL_X5;
defparam pll_x5.PSDA_SEL = "0000";
defparam pll_x5.DYN_DA_EN = "true";
defparam pll_x5.DUTYDA_SEL = DUTYDA_SEL_X5;
defparam pll_x5.CLKOUT_FT_DIR = 1'b1;
defparam pll_x5.CLKOUTP_FT_DIR = 1'b1;
defparam pll_x5.CLKOUT_DLY_STEP = 0;
defparam pll_x5.CLKOUTP_DLY_STEP = 0;
defparam pll_x5.CLKFB_SEL = "internal";
defparam pll_x5.CLKOUT_BYPASS = "false";
defparam pll_x5.CLKOUTP_BYPASS = "false";
defparam pll_x5.CLKOUTD_BYPASS = "false";
defparam pll_x5.DYN_SDIV_SEL = DYN_SDIV_SEL_X5;
defparam pll_x5.CLKOUTD_SRC = "CLKOUT";
defparam pll_x5.CLKOUTD3_SRC = "CLKOUT";
defparam pll_x5.DEVICE = "GW1NR-9C";

// Pxl Clock
CLKDIV clkdiv_inst (
    .CLKOUT(pxlClk),
    .HCLKIN(pxlClkx5),
    .RESETN(~rst),
    .CALIB(1'b0)
);

defparam clkdiv_inst.DIV_MODE = "5";
defparam clkdiv_inst.GSREN = "false";

wire[35:0] pxlToBuff, pxlFromBuff;
wire[13:0] pxlAddrWR, pxlAddrRD;
wire pxlWE;

videoCapture capInst ( .clk( pxlClk ), 
                    .rst( rst ), 
                    .dclk0( dclk0 ),
                    .dclk1( dclk1 ),
                    .hblank( hblank ),
                    .vblank( vblank ),
                    .video0( video0 ),
                    .video1( video1 ),
                    .video2( video2 ),
                    .pxlOut( pxlToBuff ),
                    .pxlAddr( pxlAddrWR ),
                    .pxlWE( pxlWE ) );

// Create the buffer.
bram_fb fb( .dout( pxlFromBuff ),
  .clka( pxlClk ),
  .cea( pxlWE ),
  .reseta( rst ),
  .clkb( pxlClk ),
  .ceb( 1 ),
  .resetb( rst ),
  .oce( 1 ),
  .ada( pxlAddrWR ),
  .din( pxlToBuff ),
  .adb( pxlAddrRD ) );


// Create Image part.
logic[2:0] tmds_int;
logic tmds_clk_int;
imageGen ig ( .pxlClk( pxlClk ),
              .pxlClkx5( pxlClkx5 ),
              .rst( rst ),
              .pxlData( pxlFromBuff ),
              .pxlAddr( pxlAddrRD ),
              .SDAT( SDAT ),
              .LRCK( LRCK ),
              .BCLK( BCLK ),
              .tmds_clk( tmds_clk_int ),
              .tmds_p( tmds_int )
              );

// ELVDS Buffers.
ELVDS_OBUF uut0(
.O(tmds_p[0]),
.OB(tmds_n[0]),
.I(tmds_int[0])
);

ELVDS_OBUF uut1(
.O(tmds_p[1]),
.OB(tmds_n[1]),
.I(tmds_int[1])
);

ELVDS_OBUF uut2(
.O(tmds_p[2]),
.OB(tmds_n[2]),
.I(tmds_int[2])
);

ELVDS_OBUF uutclk(
.O(tmds_clk_p),
.OB(tmds_clk_n),
.I(tmds_clk_int)
);


// Power up the WSC.
logic [ $clog2( POWERUPCYCLES ) - 1 : 0 ] powerCnt = 0;
logic powerOut_int;

assign powerOut = powerOut_int;

always_ff @( posedge pxlClk ) begin

  if ( rst ) begin
    powerCnt <= 0;
    powerOut_int <= 0;
  end else begin
    if ( powerCnt < POWERUPCYCLES - 1 ) begin
      powerOut_int <= 1;
      powerCnt <= powerCnt + 1;
    end else begin
      powerOut_int <= 0;
    end
  end
end

endmodule

