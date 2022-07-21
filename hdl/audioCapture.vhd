-----------------------------------------------------------------------
-- Title: WS Audio Capture
-- Author: zwenergy
-----------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
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
      else
        BCLK_del <= BCLK;
        LRCK_del <= LRCK;
        
        audioValidL <= '0';
        audioValidR <= '0';
        
        -- Channel done.
        if ( LRCK /= LRCK_del ) then
          if ( LRCK = '1' ) then
            audioValidR <= '1';
          else
            audioValidL <= '1';
          end if;
        end if;
        
        -- New audio bit.
        if ( BCLK = '1' and BCLK_del = '0' ) then
          if ( LRCK = '1' ) then
            audioBufL( 0 ) <= SDAT;
            audioBufL( 15 downto 1 ) <= audioBufL( 14 downto 0 );
          else
            audioBufR( 0 ) <= SDAT;
            audioBufR( 15 downto 1 ) <= audioBufR( 14 downto 0 );
          end if;
        end if;
        
      end if;
    end if;
  end process;
  
end rtl;
