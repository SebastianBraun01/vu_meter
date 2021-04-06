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

-- I2C or 2-Wire Bus
-- To start a transaction, pull the data line to 'L' while the clock is still 'H'
-- 7 Bits Address
-- 1 Bit R/W (0 = Write, 1 = Read)
-- 1 Bit ACK (from Slave 0 if o.k.)
-- 8 Bits Data 15..8 
-- 1 Bit Ack from slave (0 if o.k.)
-- 8 Bits Data 7..0
-- 1 Bit Ack from slave (0 if o.k.)


entity i2c is 
  port (
    clk_i:      in std_ulogic;
    reset_ni:   in std_ulogic;
    load_i:     in std_ulogic;
    data_i:     in std_ulogic_vector(23 downto 0);
    i2c_clk_o:   out std_ulogic;
    i2c_dat_o:    out std_ulogic;
	 i2c_dat_i:    in std_ulogic; 
    busy_o:      out std_ulogic  
  );
end; 

architecture rtl of i2c is

  -- Clock divider section 
  constant fd_c : integer := 24000000/20000/2; -- 24 MHz system clock, 20 kHz I2C clock   
  signal clk_cnt : integer range 0 to fd_c; 
  signal clk_cnt_reset, clk_cnt_done : std_ulogic;
  
  -- i2c data register index
  signal idx : integer range 0 to 27;
  signal idx_inc : std_ulogic;  
  signal idx_reset : std_ulogic;
  
  -- i2c registers with and without data for the acknowledgment section
  -- In cycle 8, 17 and 26 there is an i2c acknowledgement cycle where the master
  -- drives Z and the slave will drive "0" when everything is o.k. 
  -- The input data from the interface is without these acknowledgement bits
  signal load_i2c_reg_without_ack : std_ulogic;
  signal i2c_reg_without_ack      : std_ulogic_vector(23 downto 0);
  signal i2c_reg_with_ack : std_ulogic_vector(0 to 27);

  -- Statemachine
  type state_t is (idle_s, start_s, data_hold_s, data_s, clock_high_s, stop_s);
  signal state, next_state : state_t; 
  
  -- Selection for the i2c output data
  type i2c_dat_sel_t is (sel_old, sel_reg, sel_one, sel_zero);
  signal i2c_dat_sel : i2c_dat_sel_t;  
  
  type i2c_clk_sel_t is (sel_old, sel_one, sel_zero);
  signal i2c_clk_sel : i2c_clk_sel_t; 

  signal i2c_clk : std_ulogic;
  signal i2c_clk_new : std_ulogic; 
  signal i2c_dat : std_ulogic; 
  signal i2c_dat_new : std_ulogic;
  
begin

  -- i2c register with ack build from i2c without ack
  -- i2c data is transmitted msb first, so bus direction is changed also
  i2c_reg_with_ack(0 to 7)   <= i2c_reg_without_ack(23 downto 16);
  i2c_reg_with_ack(8)        <= '1';
  i2c_reg_with_ack(9 to 16)  <= i2c_reg_without_ack(15 downto 8);
  i2c_reg_with_ack(17)       <= '1';
  i2c_reg_with_ack(18 to 25) <= i2c_reg_without_ack(7 downto 0);
  i2c_reg_with_ack(26)       <= '1'; 
  i2c_reg_with_ack(27)       <= '0';
 
  -- This process counts the clocks for reducing the clock speed
  -- of the i2c clock
  clk_cnt_p : process(clk_i, reset_ni)
  begin
    if reset_ni = '0' then
	   clk_cnt <= 0; 
	 elsif rising_edge(clk_i) then
      if clk_cnt < fd_c then
        clk_cnt <= clk_cnt + 1;
      end if;
      if clk_cnt_reset = '1' then
        clk_cnt <= 0;
      end if;
	 end if; 
  end process clk_cnt_p;  
  
  clk_cnt_done <= '1' when clk_cnt = fd_c else '0';
  
  -- This is the index for the i2c register. 
  i2c_idx_p : process(clk_i, reset_ni)
  begin
    if reset_ni = '0' then
	   idx <= 0; 
	 elsif rising_edge(clk_i) then
      if idx_inc = '1' and idx < 27 then
        idx <= idx + 1; 
      end if;  
      if idx_reset = '1' then
        idx <= 0;
      end if;
    end if; 
  end process i2c_idx_p;  
  
  -- This are the registered outputs for the i2c clock and data
  i2c_out_p : process(clk_i, reset_ni)
  begin
    if reset_ni = '0' then
	   i2c_clk <= '1'; 
      i2c_dat <= '1';    
	 elsif rising_edge(clk_i) then
      i2c_dat <= i2c_dat_new;
      i2c_clk <= i2c_clk_new;  
    end if; 
  end process i2c_out_p;  
  
  -- The i2c register without ack data
  i2c_data_p : process(clk_i, reset_ni)
  begin
    if reset_ni = '0' then   
	   i2c_reg_without_ack <= (others => '0'); 
    elsif rising_edge(clk_i) then
     if load_i2c_reg_without_ack = '1' then
        i2c_reg_without_ack <= data_i;
      end if;
    end if; 
  end process i2c_data_p;
  
  -- i2c data selection process 
  i2c_dat_sel_p : process(i2c_dat_sel, i2c_reg_with_ack, i2c_dat, idx)
  begin
   case i2c_dat_sel is
    when sel_old   => i2c_dat_new <= i2c_dat;
	 when sel_reg   => i2c_dat_new <= i2c_reg_with_ack(idx); 
	 when sel_one   => i2c_dat_new <= '1';
	 when sel_zero  => i2c_dat_new <= '0';
	 when others    => i2c_dat_new <= '0'; 
   end case; 
  end process i2c_dat_sel_p; 
  
  -- i2c clock selection process
  i2c_clk_sel_p : process(i2c_clk, i2c_clk_sel)
  begin
    case i2c_clk_sel is
	   when sel_old   => i2c_clk_new <= i2c_clk;
	   when sel_one   => i2c_clk_new <= '1';
	   when sel_zero  => i2c_clk_new <= '0';
	   when others    => i2c_clk_new <= '0';
	 end case; 
  end process i2c_clk_sel_p;
 
  -- Sequential process for the statemachine 
  statem_seq_p : process(clk_i, reset_ni)
  begin
    if reset_ni = '0' then   
      state <= idle_s;
    elsif rising_edge(clk_i) then
      state <= next_state;
    end if; 
  end process statem_seq_p;
  
  statem_comb_p: process(state, load_i, idx, clk_cnt_done)
  begin
    load_i2c_reg_without_ack<= '0'; 
    idx_inc   <= '0'; 
    idx_reset <= '0';
    clk_cnt_reset <= '0';
    busy_o <= '1';
	 i2c_dat_sel <= sel_old; 
    i2c_clk_sel <= sel_old; 
    next_state <= state; 
    case state is
      when idle_s => 
        busy_o <= '0';
        i2c_clk_sel <= sel_one;
        i2c_dat_sel <= sel_one; 
        if load_i = '1' then
          load_i2c_reg_without_ack <= '1';
          clk_cnt_reset <= '1';
          idx_reset     <= '1';
          next_state <= start_s;
          i2c_dat_sel <= sel_zero; 			 
        end if;
      when start_s =>
        if clk_cnt_done = '1' then
          next_state <= data_hold_s;
          clk_cnt_reset <= '1';
          i2c_clk_sel <= sel_zero; 
        end if;
      when data_hold_s =>
          next_state  <= data_s;			 
          i2c_dat_sel <= sel_reg;
      when data_s =>
        if clk_cnt_done = '1' then  
          next_state    <= clock_high_s;			 
          i2c_clk_sel   <= sel_one;
          clk_cnt_reset <= '1';
        end if;
      when clock_high_s => 
        if clk_cnt_done = '1' then
          if idx = 27 then -- last bit transmitted
            i2c_dat_sel <= sel_one;
            next_state  <= stop_s; 
          else
            idx_inc     <= '1';
            i2c_clk_sel <= sel_zero;            
            next_state  <= data_hold_s;
          end if;  
          clk_cnt_reset  <= '1';
        end if; 
      when stop_s =>
        if clk_cnt_done = '1' then
          next_state <= idle_s;
        end if; 
      when others => 
        next_state <= idle_s;          
    end case; 
  end process statem_comb_p; 

  i2c_clk_o <= i2c_clk;
  i2c_dat_o <= i2c_dat; 
			   
end; -- architecture


