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

-- ADC (Analog to Digital Converter) Interface
-- Shifts in 16 bits and provides the data in parallel
-- When all 16 bits are shifted in, the valid_o output is set to "1" for one clock cycle

entity adcintf is 
  port (
    clk_i                  : in std_ulogic;
    reset_ni               : in std_ulogic;
    en_i                   : in std_ulogic; 
    valid_o                : out std_ulogic; 
    data_o                 : out std_ulogic_vector(15 downto 0); 
    start_i                : in std_ulogic; 
    ser_dat_i              : in std_ulogic);
end; 

architecture rtl of adcintf is
  type state_t is (idle_s, shift_s, done_s);
  signal state, new_state : state_t;
  signal idx              : integer range 0 to 15;
  signal data             : unsigned(15 downto 0);
  signal idx_inc          : std_ulogic;
  signal idx_reset        : std_ulogic;   
  signal data_shift       : std_ulogic;
begin

  seq_p : process(clk_i, reset_ni)
  begin
    if reset_ni = '0' then
      idx <= 0;
      data <= (others => '0');
      state <= idle_s;  
    elsif rising_edge(clk_i) then
      if data_shift = '1' then
        data <= shift_left(data,1);
        data(0) <= ser_dat_i;
      end if;
      if idx_reset = '1' then
        idx <= 0;
      elsif idx_inc = '1' and idx < 15 then
        idx <= idx + 1;
      end if;
      state <= new_state;
    end if; 
  end process seq_p;  

  statem_comb_p : process(state, idx, start_i, en_i)
  begin
    idx_inc    <= '0';
    idx_reset  <= '0';
    new_state  <= state;
    data_shift <= '0';
    valid_o    <= '0';
    case state is
      when idle_s => 
        if start_i = '1' and en_i = '1' then
          new_state <= shift_s;
          idx_reset <= '1';
        end if;
      when shift_s =>
        if en_i = '1' then
          idx_inc    <= '1'; 
          data_shift <= '1';
          if idx = 15 then
            new_state <= done_s;
          end if; 
        end if;
      when done_s =>
        valid_o    <= '1';
        new_state <= idle_s;
      when others => 
        new_state <= idle_s;          
    end case;
  end process statem_comb_p;
  
  data_o <= std_ulogic_vector(data);
			   
end; -- architecture


