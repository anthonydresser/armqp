----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/07/2015 07:46:35 PM
-- Design Name: 
-- Module Name: YUV_capture - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity YUV_capture is
  Port (
        din :   in  std_logic_vector(7 downto 0);
        pclk    :   in  std_logic;
        vsync   :   in  std_logic;
        href    :   in  std_logic;
        reset   :   in  std_logic;
        sw      :   in std_logic_vector(7 downto 0);
        pixel   :   out std_logic_vector(15 downto 0);
        we  :   out std_logic);
end YUV_capture;

architecture Behavioral of YUV_capture is
    TYPE    state_type  IS  (s0, s1, s2, s3);
    signal  state, next_state   :   state_type;
    --signal  cr  :   std_logic_vector(7 downto 0)    :=  (others => '0');
    signal  c  :   std_logic_vector(7 downto 0)    :=  (others => '0');
    signal  y   :   std_logic_vector(7 downto 0)    :=  (others => '0');
begin
    pixel <= (c & y);
   
--  output logic --
    process(pclk)
    begin
        if rising_edge(pclk) then
            case state is
                when s0   =>
                    c   <=  std_logic_vector(unsigned(din)+unsigned(sw));
                    we  <=  '0';
                when s1   =>
                    y   <=  din;
                    we  <=  '1';
                when s2   =>
                    c   <=  std_logic_vector(unsigned(din)+unsigned(sw));
                    we  <=  '0';
                when s3   =>
                    y   <=  din;
                    we  <=  '1';
            end case;
        end if;
    end process;
    
--  state increment --
    process(pclk, reset)
    begin
        if reset = '1' then
            state   <=  s0;
        elsif rising_edge(pclk) then
            state <= next_state;
        end if;
    end process;
    
--  next state logic --
    process(pclk)
    begin
        if rising_edge(pclk) then
            if vsync = '1' then
                next_state <= s0;
            elsif href = '0' then
                next_state <= s0;
            else
                case state is
                    when s0   =>  
                        next_state <= s1;
                    when s1   =>
                        next_state <= s2;
                    when s2   =>
                        next_state <= s3;
                    when s3   =>
                        next_state <= s0;
                end case;
            end if;
        end if;
    end process;

end Behavioral;
