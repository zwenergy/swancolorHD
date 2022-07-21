-----------------------------------------------------------------------
-- Title: WonderSwan Video Capture
-- Author: zwenergy
-----------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_misc.all;
use work.WS_defines.all;

entity videoCapture is
  port(
    clk : in std_logic;
    rst : in std_logic;
    
    dclk0 : in std_logic;
    dclk1 : in std_logic;
    hblank : in std_logic;
    vblank : in std_logic;
    -- First third of the display
    video0 : in std_logic_vector( 3 downto 0 );
    -- Second third of the display
    video1 : in std_logic_vector( 3 downto 0 );
    -- Last third of the display
    video2 : in std_logic_vector( 3 downto 0 );
    
    pxlOut : out std_logic_vector( 35 downto 0 );
    pxlWE : out std_logic;
    pxlAddr : out std_logic_vector( 13 downto 0 )
  );
end videoCapture;

architecture rtl of videoCapture is
constant FILTERLEN : integer := 5;

signal lineCnt_int : integer range 0 to 200;
signal linePxlCnt : integer range 0 to 300;
signal pxlCnt0 : integer range 0 to 11000;
-- RGB
signal colorCnt : integer range 0 to 2;
signal dclk0_del, dclk1_del, vblank_del, hblank_del, hblank_int, vblank_int, dclk0_int, dclk1_int : std_logic;
signal hblank_filter, vblank_filter, dclk0_filter, dclk1_filter : std_logic_vector( FILTERLEN - 1 downto 0 );
signal pxlBuffer0, pxlBuffer1, pxlBuffer2 : pixel;

signal bufferWriteDat : std_logic_vector( 35 downto 0 );
signal bramWE : std_logic;

type tVideofilter is array( FILTERLEN - 1 downto 0 ) of std_logic_vector( 3 downto 0 );
signal video0_filter, video1_filter, video2_filter : tVideofilter;

constant PXLSTART : integer := 2;
constant PXLLEN : integer := 80;

constant LINESTART : integer := 4;

begin

  pxlOut <= bufferWriteDat;
  pxlWE <= bramWE;

  process( clk ) is
  begin
    if ( rising_edge( clk ) ) then
      if ( rst = '1' ) then
        lineCnt_int <= 0;
        pxlCnt0 <= 0;
        linePxlCnt <= 0;
        colorCnt <= 0;
        dclk0_del <= '0';
        dclk1_del <= '0';
        vblank_del <= '1';
        hblank_del <= '0';
        bramWE <= '0';
        hblank_filter <= ( others => '0' );
        vblank_filter <= ( others => '0' );
        dclk0_filter <= ( others => '0' );
        dclk1_filter <= ( others => '0' );

        video0_filter <= ( others => ( others => '0' ) );
        video1_filter <= ( others => ( others => '0' ) );
        video2_filter <= ( others => ( others => '0' ) );
                
        dclk0_int <= '0';
        dclk1_int <= '0';

        hblank_int <= '0';
      else
      
        -- Delay pxlAddr by one clock.
        pxlAddr <= std_logic_vector( to_unsigned( pxlCnt0, pxlAddr'length ) );
      
        if ( hblank_int = '0' ) then
          if ( and_reduce( hblank_filter ) = '1' ) then
            hblank_int <= '1';
          end if;
        else
          if ( or_reduce( hblank_filter ) = '0' ) then
            hblank_int <= '0';
          end if;
        end if;

        if ( vblank_int = '0' ) then
          if ( and_reduce( vblank_filter ) = '1' ) then
            vblank_int <= '1';
          end if;
        else
          if ( or_reduce( vblank_filter ) = '0' ) then
            vblank_int <= '0';
          end if;
        end if;

        if ( dclk0_int = '0' ) then
          if ( and_reduce( dclk0_filter ) = '1' ) then
            dclk0_int <= '1';
          end if;
        else
          if ( or_reduce( dclk0_filter ) = '0' ) then
            dclk0_int <= '0';
          end if;
        end if;

        if ( dclk1_int = '0' ) then
          if ( and_reduce( dclk1_filter ) = '1' ) then
            dclk1_int <= '1';
          end if;
        else
          if ( or_reduce( dclk1_filter ) = '0' ) then
            dclk1_int <= '0';
          end if;
        end if;

        hblank_filter( FILTERLEN - 2 downto 0 ) <= hblank_filter( FILTERLEN - 1 downto 1 );
        hblank_filter( FILTERLEN - 1 ) <= hblank;
        vblank_filter( FILTERLEN - 2 downto 0 ) <= vblank_filter( FILTERLEN - 1 downto 1 );
        vblank_filter( FILTERLEN - 1 ) <= vblank;

        dclk0_filter( FILTERLEN - 2 downto 0 ) <= dclk0_filter( FILTERLEN - 1 downto 1 );
        dclk0_filter( FILTERLEN - 1 ) <= dclk0;

        dclk1_filter( FILTERLEN - 2 downto 0 ) <= dclk1_filter( FILTERLEN - 1 downto 1 );
        dclk1_filter( FILTERLEN - 1 ) <= dclk1;

        video0_filter( FILTERLEN - 2 downto 0 ) <= video0_filter( FILTERLEN - 1 downto 1 );
        video0_filter( FILTERLEN - 1 ) <= video0;
        video1_filter( FILTERLEN - 2 downto 0 ) <= video1_filter( FILTERLEN - 1 downto 1 );
        video1_filter( FILTERLEN - 1 ) <= video1;
        video2_filter( FILTERLEN - 2 downto 0 ) <= video2_filter( FILTERLEN - 1 downto 1 );
        video2_filter( FILTERLEN - 1 ) <= video2;


        dclk0_del <= dclk0_int;
        dclk1_del <= dclk1_int;
        vblank_del <= vblank_int;
        hblank_del <= hblank_int;
      
        if ( vblank_int = '0' ) then
          lineCnt_int <= 0;
          pxlCnt0 <= 0;
          linePxlCnt <= 0;
          colorCnt <= 0;
          bramWE <= '0';
          
        elsif ( hblank_int = '1' )then
          -- Rising edge
          if ( hblank_del = '0' ) then
            lineCnt_int <= lineCnt_int + 1;
          end if;
          
          linePxlCnt <= 0;
          colorCnt <= 0;
          bramWE <= '0';
        else
        
          bramWE <= '0';
          if ( hblank_int = '0' and ( ( dclk0_del xor dclk0_int ) = '1' or ( dclk1_del xor dclk1_int ) = '1' ) ) then
            -- New pixel.
            pxlBuffer0( colorCnt ) <= video0_filter( 0 );
            pxlBuffer1( colorCnt ) <= video1_filter( 0 );
            pxlBuffer2( colorCnt ) <= video2_filter( 0 );
            
            if ( colorCnt = 2 ) then
              linePxlCnt <= linePxlCnt + 1;
              colorCnt <= 0;

              -- Write.
              bufferWriteDat( 35 downto 24 ) <= pxlBuffer0( 0 ) & pxlBuffer0( 1 ) & video0_filter( 0 ) ;
              bufferWriteDat( 23 downto 12 ) <= pxlBuffer1( 0 ) & pxlBuffer1( 1 ) & video1_filter( 0 );
              bufferWriteDat( 11 downto 0 )  <= pxlBuffer2( 0 ) & pxlBuffer2( 1 ) & video2_filter( 0 );
              
              if ( linePxlCnt < PXLSTART + PXLLEN and linePxlCnt >= PXLSTART and lineCnt_int >= LINESTART ) then
                bramWE <= '1';
                pxlCnt0 <= pxlCnt0 + 1;
              end if;
              
            else
              colorCnt <= colorCnt + 1;
            end if;
            
          end if;
        
        end if;
      end if;
    end if;
  end process;

end rtl;
