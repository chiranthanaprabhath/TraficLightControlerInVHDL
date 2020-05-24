----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2020 11:14:05 AM
-- Design Name: 
-- Module Name: divider - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divider is
    Port ( reset_sync : in STD_LOGIC;
           clock : in STD_LOGIC;
           one_hz_enable : out STD_LOGIC);
end divider;

architecture Behavioral of divider is

begin
    process ( clock, reset_sync )
        constant main_clock : integer := 20;
        variable remain_tics : integer := main_clock;
        begin
            if rising_edge(clock) then
                remain_tics := remain_tics - 1;
                if reset_sync = '1' then
                    remain_tics := main_clock;
                end if;
                if remain_tics = 0 then
                    one_hz_enable <= '1';
                    remain_tics := main_clock;
                else
                    one_hz_enable <= '0';
                end if;
            end if;
        end process;
end Behavioral;
