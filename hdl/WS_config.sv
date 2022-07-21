//-----------------------------------------------------------------------
//-- Title: Config Package
//-- Author: zwenergy
//-----------------------------------------------------------------------

`define RES_480P
`define GW_IDE

package configPackage;  

  localparam COLLEN = 80;

  `ifdef RES_480P
    localparam FRAMEWIDTH = 720;
    localparam FRAMEHEIGHT = 480;
    localparam SCALE = 3;
    localparam VIDEOID = 2;
    localparam VIDEO_REFRESH = 59.94;
    localparam AUDIO_BIT_WIDTH = 16;

    localparam IDIV_SEL_X5 = 0;
    localparam FBDIV_SEL_X5 = 4;
    localparam ODIV_SEL_X5 = 4;
    localparam DUTYDA_SEL_X5 = "1000";
    localparam DYN_SDIV_SEL_X5 = 2;
  `endif

endpackage
