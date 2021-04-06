--Copyright 2013 Friedrich Beckmann, Hochschule Augsburg
--
--   Licensed under the Apache License, Version 2.0 (the "License");
--   you may not use this file except in compliance with the License.
--   You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--   Unless required by applicable law or agreed to in writing, software
--   distributed under the License is distributed on an "AS IS" BASIS,
--   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--   See the License for the specific language governing permissions and
--   limitations under the License.


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Frame Sync Generator
-- The framesync is active for one bitclock cycle

entity fsgen is 
  port (
    clk_i                   : in std_ulogic;
    reset_ni                : in std_ulogic;
    bclk_falling_edge_en_i  : in std_ulogic; 
    fs_o                    : out std_ulogic);
end; 

architecture rtl of fsgen is
  signal counter          : integer range 0 to 63;
begin

  fs_cnt_p : process(clk_i, reset_ni)
  begin
    if reset_ni = '0' then
      counter <= 0; 
      fs_o <= '0'; 
    elsif rising_edge(clk_i) then
      if bclk_falling_edge_en_i = '1' then
        fs_o <= '0';  
        if counter = 63 then 
          counter <= 0;
          fs_o <= '1'; 
        else
          counter <= counter + 1; 
        end if;
      end if;  
    end if; 
  end process fs_cnt_p;
			   
end; -- architecture


