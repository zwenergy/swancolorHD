-----------------------------------------------------------------------
-- Title: WonderSwan Defines Package
-- Author: zwenergy
-----------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package WS_defines is
  -- RGB order
  type pixel is array ( 0 to 2 ) of std_logic_vector( 3 downto 0 );
  type pixel_x3 is array( 0 to 2 ) of pixel;
  type displayLine is array( 0 to 223 ) of pixel;

end WS_defines;
