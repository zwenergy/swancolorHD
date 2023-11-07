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
  
  input logic rotate,

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


localparam int VIEWPORTLENROT_X = SCALEROT * 144;
localparam int VIEWPORTLENROT_Y = SCALEROT * 224;
localparam int VIEWPORTSTARTROT_X = ( FRAMEWIDTH - VIEWPORTLENROT_X ) / 2;
localparam int VIEWPORTSTARTROT_Y = ( FRAMEHEIGHT - VIEWPORTLENROT_Y ) / 2;
localparam int VIEWPORTENDROT_X = VIEWPORTSTARTROT_X + VIEWPORTLENROT_X;
localparam int VIEWPORTENDROT_Y = VIEWPORTSTARTROT_Y + VIEWPORTLENROT_Y;

localparam int WINDOWLENROT_X = 150 * SCALEROT;
localparam int WINDOWLENROT_Y = COLLEN * 3 * SCALEROT;

localparam int WINDOWENDROT_X = VIEWPORTSTARTROT_X + WINDOWLENROT_X;
localparam int WINDOWENDROT_Y = FRAMEHEIGHT;


logic [23:0] rgb;
logic [10:0] cy, frameHeight;
logic [11:0] cx, frameWidth;
logic [13:0] pxlAddrBuffer;
logic [8:0] lineCntPxl;
logic [2:0] colCnt, colCnt_del;
logic [13:0] lineBase;
logic [23:0] latestPixel;
logic [7:0] lineCntAbs, lineCntRel;

logic [3:0] scaleCntX, scaleCntY;

logic [15:0] audioL, audioR, audioLBuff, audioRBuff;
logic audioValidL, audioValidR;

localparam int AUDIOCLKMAXCNT = ( CLKFRQ / 48 );
logic [$clog2(AUDIOCLKMAXCNT)-1:0] audioCnt;
logic audioClk;

logic rotate_int;

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
  rotate_int <= !rotate;

  if ( colCnt_del == 0 )
    latestPixel <= {pxlData[35:32], 4'b0000, pxlData[31:28], 4'b0000, pxlData[27:24], 4'b0000 };
  else if ( colCnt_del == 1 ) 
    latestPixel <= {pxlData[23:20], 4'b0000, pxlData[19:16], 4'b0000, pxlData[15:12], 4'b0000 };
  else
    latestPixel <= {pxlData[11:8], 4'b0000, pxlData[7:4], 4'b0000, pxlData[3:0], 4'b0000 };
  
  // Regular, not rotated video
  if ( !rotate_int ) begin
    if ( cx == VIEWPORTSTART_X )
      lineBase <= pxlAddrBuffer;


    if ( cy > WINDOWEND_Y ) begin
      pxlAddrBuffer <= 0;
      lineCntPxl <= 0;
      scaleCntX <= 0;
      scaleCntY <= 0;
      lineBase <= 0;
      colCnt <= 0;

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
      rgb <= {24{1'b0}};
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
  
  
  // Rotated video.
  end else begin
    if ( cx == VIEWPORTSTARTROT_X )
      lineBase <= pxlAddrBuffer;
    
    if ( cy > VIEWPORTENDROT_Y ) begin
      pxlAddrBuffer <= COLLEN - 1 - 16;
      lineCntPxl <= 0;
      scaleCntX <= 0;
      scaleCntY <= 0;
      lineBase <= 0;
      colCnt <= 2;
      lineCntAbs <= 16;
      lineCntRel <= 16;

    end

    // Viewport stuff
    if ( cx > VIEWPORTSTARTROT_X && cx <= VIEWPORTENDROT_X && cy > VIEWPORTSTARTROT_Y && cy <= VIEWPORTENDROT_Y )
    begin
      rgb <= latestPixel;
    end 
    else begin
      rgb <= {24{1'b0}};
    end
    
    
    // Set ColCnt.
    if ( lineCntAbs <= COLLEN - 1 ) begin
      colCnt <= 2;
      
    end else if ( lineCntAbs <= ( 2 * COLLEN ) - 1 ) begin
      colCnt <= 1;
      
    end else begin
      colCnt <= 0;
    end;
    

    // Actual FB window.
    if ( cx > VIEWPORTSTARTROT_X && cx <= WINDOWENDROT_X && cy > VIEWPORTSTARTROT_Y && cy <= VIEWPORTENDROT_Y )
    begin
      if ( ( lineCntPxl == 150 - 1 ) && ( scaleCntX == SCALEROT - 1 ) ) begin
        // End of a line.
        lineCntPxl <= 0;
        scaleCntX <= 0;
        
        if ( scaleCntY == SCALEROT - 1 ) begin
          lineCntAbs <= lineCntAbs + 1;
          scaleCntY <= 0;
          
          if ( lineCntRel == COLLEN - 1 ) begin
            lineCntRel <= 0;
            pxlAddrBuffer <= COLLEN - 1;
            
          end else begin
            lineCntRel <= lineCntRel + 1;
            pxlAddrBuffer <= lineBase - 1;
          
          end;
        
        end else begin
          scaleCntY <= scaleCntY + 1;
          pxlAddrBuffer <= lineBase;
        end;
        
        
      end else begin
        if ( scaleCntX == SCALEROT - 1 ) begin
          lineCntPxl <= lineCntPxl + 1;
          scaleCntX <= 0;
          pxlAddrBuffer <= pxlAddrBuffer + COLLEN;
        end else begin
          scaleCntX <= scaleCntX + 1;
        end;
        
      end;
      
    end else begin
      //colCnt <= 2;
      //lineCntAbs <= 0;
      //lineCntRel <= 0;
      lineCntPxl <= 0;

    end
      
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
`ifdef CUSTOM_RES
        .CUSTOM_FRAME_WIDTH( CUSTOM_FRAME_WIDTH ),
        .CUSTOM_FRAME_HEIGHT( CUSTOM_FRAME_HEIGHT ),
        .CUSTOM_SCREEN_WIDTH( CUSTOM_SCREEN_WIDTH ),
        .CUSTOM_SCREEN_HEIGHT( CUSTOM_SCREEN_HEIGHT ),
        .CUSTOM_HSYNC_PULSE_START( CUSTOM_HSYNC_PULSE_START ),
        .CUSTOM_HSYNC_PULSE_SIZE( CUSTOM_HSYNC_PULSE_SIZE ),
        .CUSTOM_VSYNC_PULSE_START( CUSTOM_VSYNC_PULSE_START ),
        .CUSTOM_VSYNC_PULSE_SIZE( CUSTOM_VSYNC_PULSE_SIZE ),
        .CUSTOM_INVERT( CUSTOM_INVERT ),
        .CUSTOM_VIDEO_RATE( CUSTOM_VIDEO_RATE ),
        .CUSTOM_BIT_WIDTH( CUSTOM_BIT_WIDTH ),
        .CUSTOM_BIT_HEIGHT( CUSTOM_BIT_HEIGHT ),
`endif
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
