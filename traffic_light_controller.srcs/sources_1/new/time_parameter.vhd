----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2020 11:58:47 AM
-- Design Name: 
-- Module Name: time_parameter - Behavioral
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

entity time_parameter is
    Port ( reset_sync : in STD_LOGIC;
           prog_sync : in STD_LOGIC;
           para_selector : in STD_LOGIC_VECTOR (1 downto 0);
           time_value : in STD_LOGIC_VECTOR (3 downto 0);
           interval : in STD_LOGIC_VECTOR (1 downto 0) := "00";
           value : out STD_LOGIC_VECTOR (3 downto 0);
           clock : in STD_LOGIC);
end time_parameter;

architecture Behavioral of time_parameter is

signal t_base: STD_LOGIC_VECTOR (3 downto 0) := "0110";
signal t_ext: STD_LOGIC_VECTOR (3 downto 0) := "0011";
signal t_yel: STD_LOGIC_VECTOR (3 downto 0) := "0010";

begin
    process (clock, reset_sync, prog_sync)
        begin
            if rising_edge(clock) then
                if reset_sync = '1' then
                    t_base <= "0110";
                    t_ext <= "0011";
                    t_yel <= "0010";
                elsif prog_sync = '1' then
                    if para_selector = "00" then
                        t_base <= time_value;
                    elsif para_selector = "01" then
                        t_ext <= time_value;
                    elsif para_selector = "10" then
                        t_yel <= time_value;
                    end if;
                end if;
            end if;
    end process;
        
        process ( clock, interval )
            begin
                if ( clock 'event and clock = '1' ) then
                    if interval = "00" then
                        value <= t_base;
                    elsif interval = "01" then
                        value <= t_ext;
                    elsif interval = "10" then
                        value <= t_yel;
                    else
                        value <= t_base;
                    end if;
                end if;
        end process;
end Behavioral;
