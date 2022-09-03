//-----------------------------------------------------------------------
//-- Title: Image Gen
//-- Author: zwenergy
//-----------------------------------------------------------------------

import configPackage::*;


module imageGen
(
  input logic pxlClk,
  input logic pxlClkx5,
  input logic rst,
  
  input logic[35:0] pxlData,
  output logic[13:0] pxlAddr,

  // Audio
  input logic SDAT,
  input logic LRCK,
  input logic BCLK,
  
  output logic tmds_clk,
  output logic[2:0] tmds_p,
  output logic[2:0] tmds_n
);

localparam int VIEWPORTLEN_X = SCALE * 224;
localparam int VIEWPORTLEN_Y = SCALE * 144;
localparam int VIEWPORTSTART_X = ( FRAMEWIDTH - VIEWPORTLEN_X ) / 2;
localparam int VIEWPORTSTART_Y = ( FRAMEHEIGHT - VIEWPORTLEN_Y ) / 2;
localparam int VIEWPORTEND_X = VIEWPORTSTART_X + VIEWPORTLEN_X;
localparam int VIEWPORTEND_Y = VIEWPORTSTART_Y + VIEWPORTLEN_Y;

localparam int WINDOWLEN_X = COLLEN * 3 * SCALE;
localparam int WINDOWLEN_Y = 150 * SCALE;

localparam int WINDOWEND_X = VIEWPORTSTART_X + WINDOWLEN_X;
localparam int WINDOWEND_Y = FRAMEHEIGHT;

logic [23:0] rgb;
logic [10:0] cy, frameHeight;
logic [11:0] cx, frameWidth;
logic [13:0] pxlAddrBuffer;
logic [8:0] lineCntPxl;
logic [2:0] colCnt, colCnt_del;
logic [13:0] lineBase;
logic [23:0] latestPixel;

logic [3:0] scaleCntX, scaleCntY;

logic [15:0] audioL, audioR, audioLBuff, audioRBuff;
logic audioValidL, audioValidR;

localparam int AUDIOCLKMAXCNT = ( CLKFRQ / 48 );
logic [$clog2(AUDIOCLKMAXCNT)-1:0] audioCnt;
logic audioClk;

assign pxlAddr = pxlAddrBuffer;


// Audio stuff.
always_ff @( posedge pxlClk ) begin
  if ( audioCnt == AUDIOCLKMAXCNT - 1 )
    audioCnt <= 0;
  else
    audioCnt <= audioCnt + 1;

  if ( audioCnt >= AUDIOCLKMAXCNT / 2 )
    audioClk <= 1;
  else
    audioClk <= 0;
  
  if ( audioValidL == 1 )
    audioLBuff <= audioL >>> 2;

  if ( audioValidR == 1 )
    audioRBuff <= audioR >>> 2;

end


always_ff @( posedge pxlClk ) begin
  colCnt_del <= colCnt;

  if ( colCnt_del == 0 )
    latestPixel <= {pxlData[35:32], 4'b0000, pxlData[31:28], 4'b0000, pxlData[27:24], 4'b0000 };
  else if ( colCnt_del == 1 ) 
    latestPixel <= {pxlData[23:20], 4'b0000, pxlData[19:16], 4'b0000, pxlData[15:12], 4'b0000 };
  else
    latestPixel <= {pxlData[11:8], 4'b0000, pxlData[7:4], 4'b0000, pxlData[3:0], 4'b0000 };

  if ( cx == VIEWPORTSTART_X )
    lineBase <= pxlAddrBuffer;


  if ( cy > WINDOWEND_Y ) begin
    pxlAddrBuffer <= 0;
    lineCntPxl <= 0;
    scaleCntX <= 0;
    scaleCntY <= 0;
    lineBase <= 0;

  end else if ( cx == WINDOWEND_X + 1 ) begin
    scaleCntX <= 0;

    if ( scaleCntY == SCALE - 1 ) begin
      scaleCntY <= 0;
    end else begin
      scaleCntY <= scaleCntY + 1;
    end
  end

  // Viewport stuff
  if ( cx > VIEWPORTSTART_X && cx <= VIEWPORTEND_X && cy > VIEWPORTSTART_Y && cy <= VIEWPORTEND_Y )
  begin
    rgb <= latestPixel;
  end 
  else begin
    rgb <= {24{1'b1}};
  end

  // Actual FB window.
  if ( cx > VIEWPORTSTART_X && cx <= WINDOWEND_X && cy > VIEWPORTSTART_Y && cy <= WINDOWEND_Y )
  begin
    if ( ( lineCntPxl == COLLEN - 1 ) && ( scaleCntX == SCALE - 1 ) ) begin
      if ( ( colCnt < 2 ) || ( scaleCntY < SCALE - 1 ) )
        pxlAddrBuffer <= lineBase;
      else
        pxlAddrBuffer <= pxlAddrBuffer + 1;
            
      lineCntPxl <= 0;
      scaleCntX <= 0;
      colCnt <= colCnt + 1;
    end else begin
      if ( scaleCntX == SCALE - 1 ) begin
        lineCntPxl <= lineCntPxl + 1;
        pxlAddrBuffer <= pxlAddrBuffer + 1;
        scaleCntX <= 0;

      end else begin
       scaleCntX <= scaleCntX + 1;
      end;
    end
  end

  else begin
    colCnt <= 0;
    lineCntPxl <= 0;
  end
end

logic[2:0] tmds;
assign tmds_p = tmds;
assign tmds_clk = pxlClk;

logic [AUDIO_BIT_WIDTH-1:0] audioWord [1:0];
assign audioWord[0] = audioRBuff;
assign audioWord[1] = audioLBuff;

// Instantiate video module.
hdmi #( .VIDEO_ID_CODE(VIDEOID), 
        .DVI_OUTPUT(0), 
        .VIDEO_REFRESH_RATE(VIDEO_REFRESH),
        .IT_CONTENT(1),
        .AUDIO_RATE(48000), 
        .AUDIO_BIT_WIDTH(AUDIO_BIT_WIDTH),
        .START_X(0),
        .START_Y(0) )

hdmi( .clk_pixel_x5(pxlClkx5), 
      .clk_pixel(pxlClk), 
      .clk_audio(audioClk),
      .rgb(rgb), 
      .reset( rst ),
      .audio_sample_word(audioWord),
      .tmds(tmds), 
      .tmds_clock(tmdsClk), 
      .cx(cx), 
      .cy(cy),
      .frame_width( frameWidth ),
      .frame_height( frameHeight ) );


// Instantiate audio capture.
audioCapture audio(
  .clk( pxlClk ),
  .rst( rst ),
  .LRCK( LRCK ),
  .SDAT( SDAT ),
  .BCLK( BCLK ),
  .audioOutL( audioL ),
  .audioOutR( audioR ),
  .audioValidR( audioValidR ),
  .audioValidL( audioValidL ) );
      
endmodule
