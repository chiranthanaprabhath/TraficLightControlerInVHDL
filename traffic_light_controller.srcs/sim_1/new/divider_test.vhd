----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2020 01:33:59 PM
-- Design Name: 
-- Module Name: divider_test - Behavioral
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

entity divider_test is
--  Port ( );
end divider_test;

architecture Behavioral of divider_test is

component divider is
    Port ( reset_sync : in STD_LOGIC;
           clock : in STD_LOGIC;
           one_hz_enable : out STD_LOGIC);
end component;

signal reset_sync : STD_LOGIC := '0';
signal clock : STD_LOGIC := '0';
signal one_hz_enable : STD_LOGIC := '0';

begin

uut_1 : divider
    port map ( reset_sync => reset_sync,
               clock => clock,
               one_hz_enable => one_hz_enable);

clock <= not clock after 1ns;

--stimuli : process
--    begin
--        reset_sync <= '0';
--        wait for 100ns;
--    end process;

end Behavioral;
