-----------------------------------------------------------------------
-- Title: WS Audio Capture
-- Author: zwenergy
-----------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_misc.all;
use work.WS_defines.all;

entity audioCapture is
  port(
    clk : in std_logic;
    rst : in std_logic;
    
    -- To the HW
    LRCK : in std_logic;
    SDAT : in std_logic;
    BCLK : in std_logic;
    
    -- 2's compliment
    audioOutL : out std_logic_vector( 15 downto 0 );
    audioOutR : out std_logic_vector( 15 downto 0 );
    audioValidL : out std_logic;
    audioValidR : out std_logic
    
  );
end audioCapture;

architecture rtl of audioCapture is
constant FILTERLEN : integer := 5;

signal LRCK_filter, SDAT_filter, BCLK_filter : std_logic_vector( FILTERLEN - 1 downto 0 );
signal LRCK_int, SDAT_int, BCLK_int : std_logic;

signal audioBufL, audioBufR : std_logic_vector( 15 downto 0 );
signal BCLK_del, LRCK_del : std_logic;
begin
  
  audioOutL <= audioBufL;
  audioOutR <= audioBufR;
  
  process( clk ) is
  begin
    if rising_edge( clk ) then
      if ( rst = '1' ) then
        audioBufL <= ( others => '0' );
        audioBufR <= ( others => '0' );
        audioValidL <= '0';
        audioValidR <= '0';
        BCLK_del <= '0';
        LRCK_del <= '0';
        LRCK_filter <= ( others => '0' );
        SDAT_filter <= ( others => '0' );
        BCLK_filter <= ( others => '0' );
        LRCK_int <= '0';
        BCLK_int <= '0';
        SDAT_int <= '0';
      else
        BCLK_filter( FILTERLEN - 2 downto 0 ) <= BCLK_filter( FILTERLEN - 1 downto 1 );
        BCLK_filter( FILTERLEN - 1 ) <= BCLK;

        SDAT_filter( FILTERLEN - 2 downto 0 ) <= SDAT_filter( FILTERLEN - 1 downto 1 );
        SDAT_filter( FILTERLEN - 1 ) <= SDAT;

        LRCK_filter( FILTERLEN - 2 downto 0 ) <= LRCK_filter( FILTERLEN - 1 downto 1 );
        LRCK_filter( FILTERLEN - 1 ) <= LRCK;

        if ( BCLK_int = '0' ) then
          if ( and_reduce( BCLK_filter ) = '1' ) then
            BCLK_int <= '1';
          end if;
        else
          if ( or_reduce( BCLK_filter ) = '0' ) then
            BCLK_int <= '0';
          end if;
        end if;

        if ( LRCK_int = '0' ) then
          if ( and_reduce( LRCK_filter ) = '1' ) then
            LRCK_int <= '1';
          end if;
        else
          if ( or_reduce( LRCK_filter ) = '0' ) then
            LRCK_int <= '0';
          end if;
        end if;

        if ( SDAT_int = '0' ) then
          if ( and_reduce( SDAT_filter ) = '1' ) then
            SDAT_int <= '1';
          end if;
        else
          if ( or_reduce( SDAT_filter ) = '0' ) then
            SDAT_int <= '0';
          end if;
        end if;

        BCLK_del <= BCLK_int;
        LRCK_del <= LRCK_int;
        
        audioValidL <= '0';
        audioValidR <= '0';
        
        -- Channel done.
        if ( LRCK_int /= LRCK_del ) then
          if ( LRCK_int = '1' ) then
            audioValidR <= '1';
          else
            audioValidL <= '1';
          end if;
        end if;
        
        -- New audio bit.
        if ( BCLK_int = '1' and BCLK_del = '0' ) then
          if ( LRCK_int = '1' ) then
            audioBufL( 0 ) <= SDAT_int;
            audioBufL( 15 downto 1 ) <= audioBufL( 14 downto 0 );
          else
            audioBufR( 0 ) <= SDAT_int;
            audioBufR( 15 downto 1 ) <= audioBufR( 14 downto 0 );
          end if;
        end if;
        
      end if;
    end if;
  end process;
  
end rtl;
