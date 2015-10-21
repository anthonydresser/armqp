----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/05/2015 04:50:38 PM
-- Design Name: 
-- Module Name: capture - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity capture is
  Port (
  		pclk : in std_logic;
  		d : in std_logic_vector(7 downto 0);
  		we : out std_logic;
  		dout : out std_logic_vector(11 downto 0));
end capture;

architecture Behavioral of capture is
	signal d_latch : std_logic_vector(15 downto 0) := (others => '0');
	signal data : std_logic_vector(15 downto 0) := (others => '0');
	signal wr_e : std_logic := '1';

begin
	we <= wr_e;
	dout <= data;

	process(pclk)
	begin
		if rising_edge(pclk) then
			wr_e <= (not wr_e);
            data <= d_latch(15 downto 12) & d_latch(10 downto 7) & d_latch(4 downto 1); 
			d_latch <= (d_latch(7 downto 0) & d);
		end if;
	end process;

end Behavioral;
