----------------------------------------------------------------------
-- File Downloaded from http://www.nandland.com
----------------------------------------------------------------------
-- This is the top of the UART.  It instantiates both the transmitter
-- and the receiver modules.  If only the receiver OR the transmitter
-- is needed, those modules can be instantiated by themselves.
-- o_tx_done is set high for one clock cycle when transmit is complete
-- o_rx_dv is set high for one clock cycle when receive is complete
--
-- Set Generic g_CLKS_PER_BIT as follows:
-- g_CLKS_PER_BIT = (Frequency of i_clk)/(Frequency of UART)
-- Example: 10 MHz Clock, 115200 baud UART
-- (10000000)/(115200) = 87
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.uart_pkg.all;
  
entity uart_top is
  generic (
    g_CLKS_PER_BIT : integer := 115
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
end uart_top;

architecture rtl of uart_top is

  
begin

  UART_RX_INST : uart_rx
    generic map (
      g_CLKS_PER_BIT => g_CLKS_PER_BIT
      )
    port map (
      i_clk       => i_clk,
      i_rx_serial => i_rx_serial,
      o_rx_dv     => o_rx_dv,
      o_rx_byte   => o_rx_byte
      );  
  
  UART_TX_INST : uart_tx
    generic map (
      g_CLKS_PER_BIT => g_CLKS_PER_BIT
      )
    port map (
      i_clk       => i_clk,
      i_tx_dv     => i_tx_dv,
      i_tx_byte   => i_tx_byte,
      o_tx_done   => o_tx_done,
      o_tx_serial => o_tx_serial
      );

end rtl;
