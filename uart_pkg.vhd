----------------------------------------------------------------------
-- File Downloaded from http://www.nandland.com
----------------------------------------------------------------------
-- This file contains the package for the UART.  Use this package
-- to define the TX, RX, and UART Top Components.
library ieee;
use ieee.std_logic_1164.all;

package uart_pkg is

  
  component uart_top is
    generic (
      g_CLKS_PER_BIT : integer
      );
    port (
      i_clk       : in  std_logic;
      -- 
      i_tx_dv     : in  std_logic;
      i_tx_byte   : in  std_logic_vector(7 downto 0);
      o_tx_done   : out std_logic;
      o_tx_serial : out std_logic;
      --
      i_rx_serial : in  std_logic;
      o_rx_dv     : out std_logic;
      o_rx_byte   : out std_logic_vector(7 downto 0)
      );
  end component;

  
  component uart_tx is
    generic (
      g_CLKS_PER_BIT : integer
      );
    port (
      i_clk       : in  std_logic;
      i_tx_dv     : in  std_logic;
      i_tx_byte   : in  std_logic_vector(7 downto 0);
      o_tx_done   : out std_logic;
      o_tx_serial : out std_logic
      );
  end component;

  
  component uart_rx is
    generic (
      g_CLKS_PER_BIT : integer
      );
    port (
      i_clk       : in  std_logic;
      i_rx_serial : in  std_logic;
      o_rx_dv     : out std_logic;
      o_rx_byte   : out std_logic_vector(7 downto 0)
      );
  end component;
  

end package uart_pkg;
