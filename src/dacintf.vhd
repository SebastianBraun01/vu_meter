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

-- DAC (Digital to Analog Converter) Interface
-- Loads a word in parallel and shifts it out as serial bit stream
-- The data needs to be shifted out twice. This is required as 
-- the audio interface needs stereo data.

entity dacintf is 
  port (
    clk_i                  : in std_ulogic;
    reset_ni               : in std_ulogic;
    load_i                 : in std_ulogic; 
    data_i                 : in std_ulogic_vector(15 downto 0); 
    en_i                   : in std_ulogic; 
    ser_dat_o              : out std_ulogic);
end; 

architecture rtl of dacintf is
  signal idx              : integer range 0 to 31;
  signal data             : unsigned(15 downto 0);  
begin

  load_and_shift_p : process(clk_i, reset_ni)
  begin
    if reset_ni = '0' then
      idx  <= 0;
      data <= (others => '0');  
    elsif rising_edge(clk_i) then
      if load_i = '1' and en_i = '1' then
        data <= unsigned(data_i);
        idx  <= 0; 
      elsif en_i = '1' and idx < 31 then
        data <= rotate_left(data,1); 
        idx <= idx + 1; 
      end if; 
    end if; 
  end process load_and_shift_p;

  ser_dat_o <= data(15);   
			   
end; -- architecture


