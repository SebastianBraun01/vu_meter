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

-- Bitclock generator

entity bclk is 
  port (
    clk_i                  : in std_ulogic;
    reset_ni               : in std_ulogic; 
    bclk_o                 : out std_ulogic;
    bclk_falling_edge_en_o : out std_ulogic);
end; 

architecture rtl of bclk is
  signal clk_counter          : integer range 0 to 47;
  signal bclk_rising_edge_en  : std_ulogic; 
  signal bclk_falling_edge_en : std_ulogic;  
begin

  bclk_cnt_p : process(clk_i, reset_ni)
  begin
    if reset_ni = '0' then
      clk_counter <= 0; 
    elsif rising_edge(clk_i) then
      if clk_counter = 47 then 
        clk_counter <= 0;
      else
        clk_counter <= clk_counter + 1; 
      end if; 
    end if; 
  end process bclk_cnt_p;

  edge_comb_p : process(clk_counter)
  begin
    bclk_rising_edge_en  <= '0';
    bclk_falling_edge_en <= '0'; 
    if clk_counter = 47 then
      bclk_rising_edge_en <= '1';
    end if; 
    if clk_counter = 23 then 
      bclk_falling_edge_en <= '1';
    end if;      
  end process edge_comb_p;

  bclk_p : process(clk_i, reset_ni)
  begin
    if reset_ni = '0' then
      bclk_o <= '0'; 
    elsif rising_edge(clk_i) then
      if bclk_rising_edge_en = '1' then
        bclk_o <= '1';
      elsif bclk_falling_edge_en = '1' then
        bclk_o <= '0'; 
      end if; 
    end if;   
  end process bclk_p; 

  bclk_falling_edge_en_o <= bclk_falling_edge_en;   
			   
end; -- architecture


