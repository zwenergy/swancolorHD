//-----------------------------------------------------------------------
//-- Title: Config Package
//-- Author: zwenergy
//-----------------------------------------------------------------------

`define RES_480P
`define GW_IDE

package configPackage;  

  `ifdef RES_480P
    localparam FRAMEWIDTH = 720;
    localparam FRAMEHEIGHT = 480;
    localparam TOTALWIDTH = 858;
    localparam TOTALHEIGHT = 525;
    localparam SCALE = 3;
    localparam SCALEROT = 2;
    localparam VIDEOID = 2;
    localparam VIDEO_REFRESH = 59.94;

    localparam IDIV_SEL_X5 = 0;
    localparam FBDIV_SEL_X5 = 4;
    localparam ODIV_SEL_X5 = 4;
    localparam DUTYDA_SEL_X5 = "1000";
    localparam DYN_SDIV_SEL_X5 = 2;
    
    localparam CLKFRQ = 27000;
  `endif
  
  `ifdef RES_480P_75HZ
    // Pixelclock x5 runs at 169.714 MHz, which results to
    // 75.353 Hz, close to the original 75.4 Hz
    localparam FRAMEWIDTH = 720;
    localparam FRAMEHEIGHT = 480;
    localparam TOTALWIDTH = 858;
    localparam TOTALHEIGHT = 525;
    localparam SCALE = 3;
    localparam SCALEROT = 2;
    localparam VIDEOID = 0;
    localparam VIDEO_REFRESH = 75.353;

    localparam IDIV_SEL_X5 = 6;
    localparam FBDIV_SEL_X5 = 43;
    localparam ODIV_SEL_X5 = 4;
    localparam DUTYDA_SEL_X5 = "1000";
    localparam DYN_SDIV_SEL_X5 = 2;

    localparam CUSTOM_FRAME_WIDTH = 858;
    localparam CUSTOM_FRAME_HEIGHT = 525;
    localparam CUSTOM_SCREEN_WIDTH = 720;
    localparam CUSTOM_SCREEN_HEIGHT = 480;
    localparam CUSTOM_HSYNC_PULSE_START = 16;
    localparam CUSTOM_HSYNC_PULSE_SIZE = 62;
    localparam CUSTOM_VSYNC_PULSE_START = 9;
    localparam CUSTOM_VSYNC_PULSE_SIZE = 6;
    localparam CUSTOM_INVERT = 1;
    localparam CUSTOM_VIDEO_RATE = 33.942E6;
    localparam CUSTOM_BIT_WIDTH = 10;
    localparam CUSTOM_BIT_HEIGHT = 10;
    
    localparam CLKFRQ = 33942;
  `endif

  `ifdef RES_720P
    localparam FRAMEWIDTH = 1280;
    localparam FRAMEHEIGHT = 720;
    localparam TOTALWIDTH = 1650;
    localparam TOTALHEIGHT = 750;
    localparam SCALE = 5;
    localparam SCALEROT = 3;
    localparam VIDEOID = 4;
    localparam VIDEO_REFRESH = 60.0;

    localparam IDIV_SEL_X5 = 3;
    localparam FBDIV_SEL_X5 = 54;
    localparam ODIV_SEL_X5 = 2;
    localparam DUTYDA_SEL_X5 = "1000";
    localparam DYN_SDIV_SEL_X5 = 2;
    
    localparam CLKFRQ = 74250;
  `endif
  
    `ifdef RES_720P_75HZ
    `define CUSTOM_RES
    // Pixelclock x5 runs at 382,5 MHz, which results to
    // 75.769 Hz
    localparam FRAMEWIDTH = 1280;
    localparam FRAMEHEIGHT = 720;
    localparam TOTALWIDTH = 1360;
    localparam TOTALHEIGHT = 746;
    localparam SCALE = 5;
    localparam SCALEROT = 3;
    localparam VIDEOID = 0;
    localparam VIDEO_REFRESH = 60.0;

    localparam IDIV_SEL_X5 = 3;
    localparam FBDIV_SEL_X5 = 56;
    localparam ODIV_SEL_X5 = 2;
    localparam DUTYDA_SEL_X5 = "1000";
    localparam DYN_SDIV_SEL_X5 = 2;
    
    localparam CUSTOM_FRAME_WIDTH = 1360;
    localparam CUSTOM_FRAME_HEIGHT = 746;
    localparam CUSTOM_SCREEN_WIDTH = 1280;
    localparam CUSTOM_SCREEN_HEIGHT = 720;
    localparam CUSTOM_HSYNC_PULSE_START = 8;
    localparam CUSTOM_HSYNC_PULSE_SIZE = 32;
    localparam CUSTOM_VSYNC_PULSE_START = 12;
    localparam CUSTOM_VSYNC_PULSE_SIZE = 8;
    localparam CUSTOM_INVERT = 0;
    localparam CUSTOM_VIDEO_RATE = 76.5E6;
    localparam CUSTOM_BIT_WIDTH = 11;
    localparam CUSTOM_BIT_HEIGHT = 10;
    
    localparam CLKFRQ = 76500;
  `endif

  localparam COLLEN = 80;
  localparam AUDIO_BIT_WIDTH = 16;

  localparam POWERUPNS = 100000000.0;
  localparam CLKPERNS = (1.0/CLKFRQ)*1000000.0;
  localparam int POWERUPCYCLES = $ceil( POWERUPNS/CLKPERNS );

endpackage
