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

entity i2c_sub is 
  port (
    clk_i:      in std_ulogic;
    reset_ni:   in std_ulogic;
    i2c_dat_o:  out std_ulogic;
    i2c_dat_i:  in std_ulogic;
    i2c_clk_o:  out std_ulogic);
end; 

architecture struct of i2c_sub is

component i2c is 
  port (
    clk_i:      in std_ulogic;
    reset_ni:    in std_ulogic;
    load_i:     in std_ulogic;
    data_i:     in std_ulogic_vector(23 downto 0);
    i2c_clk_o:   out std_ulogic;
    i2c_dat_o:   out std_ulogic;
	 i2c_dat_i:   in std_ulogic; 
    busy_o:      out std_ulogic  
  );
end component; 

component i2c_write is
  port (
    clk_i:      in std_ulogic;
    reset_ni:   in std_ulogic;
    load_o:     out std_ulogic;
    data_o:     out std_ulogic_vector(23 downto 0);
    busy_i:     in std_ulogic);
end component; 

  signal load, busy : std_ulogic;
  signal data : std_ulogic_vector(23 downto 0);

begin

  i2c_i0 : i2c
    port map (
      clk_i        => clk_i,
      reset_ni     => reset_ni,
      load_i       => load,
      data_i       => data,
      i2c_clk_o    => i2c_clk_o,
      i2c_dat_o    => i2c_dat_o,
		i2c_dat_i    => i2c_dat_i,
      busy_o       => busy);

  i2_write_i0 : i2c_write
    port map (
      clk_i        => clk_i,
      reset_ni     => reset_ni,
      load_o       => load,
      data_o       => data,
      busy_i       => busy);
 			   
end; -- architecture


