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

entity i2c_write is
  port (
    clk_i:      in std_ulogic;
    reset_ni:   in std_ulogic;
    load_o:     out std_ulogic;
    data_o:     out std_ulogic_vector(23 downto 0);
    busy_i:     in std_ulogic);
end; 

architecture rtl of i2c_write is
  constant num_regs_c : integer := 12;
  type state_t is (start_s, wait_s, done_s);
  signal state, next_state : state_t;
  signal counter : integer range 0 to num_regs_c-1; 
  signal counter_enable : std_ulogic;
  type data_array_t is array(0 to num_regs_c-1) of std_ulogic_vector(23 downto 0);
 
  constant data_array : data_array_t := (
    X"341200", -- Set Inactive
    X"341E00", -- Reset the Device
    X"34001A", -- Left Line In / Mute off / Volume
    X"34021A", -- Right Line In
    X"34046F", -- Headphone Left
    X"34066F", -- Headphone Right
    X"340815", -- Analog path control (MIC to ADC, DAC to output, MIC Boost)
    X"340A00", -- Digital path control
    X"340C61", -- Power Down Control (Everything switched on)
    X"340E13", -- Digital Audio Interface Format (Slave Mode, DSP Mode, 16 Bit)
    X"34100C", -- Sampling Control (8 kHz Sampling frequency, 12.288 MHz MCLK frequency)
    X"341201"); -- Active Control (Activate) 
   
begin

  seq_p : process(clk_i, reset_ni)
  begin
    if reset_ni = '0' then
      state <= start_s;
      counter <= 0;
    elsif rising_edge(clk_i) then
      state <= next_state;
      if counter_enable = '1' then
        if counter < num_regs_c - 1 then
          counter <= counter + 1; 
        else
          counter <= 0;
        end if;
      end if; 
    end if; 
  end process seq_p;

  data_o <= data_array(counter);

  process(state, counter, busy_i)
  begin
    load_o <= '0';
    counter_enable <= '0';
    next_state <= state;
    case state is
      when start_s => 
        load_o <= '1';
        next_state <= wait_s;  
      when wait_s =>
        if busy_i = '0' then
          if counter = num_regs_c-1 then
            next_state <= done_s;
            --counter_enable <= '1';
          else
            next_state     <= start_s;
            counter_enable <= '1';
          end if; 
        end if; 
      when others => 
        next_state <= state;          
    end case; 
  end process; 
			   
end; -- architecture


