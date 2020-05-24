----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2020 07:23:12 PM
-- Design Name: 
-- Module Name: timer_test - Behavioral
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

entity timer_test is
--  Port ( );
end timer_test;

architecture Behavioral of timer_test is

component timer is
    Port ( value : in STD_LOGIC_VECTOR (3 downto 0);
           start_timer : in STD_LOGIC;
           one_hz_enable : in STD_LOGIC;
           clock : in STD_LOGIC;
           reset_sync : in STD_LOGIC;
           expired : out STD_LOGIC);
end component;

signal value : STD_LOGIC_VECTOR (3 downto 0);
signal start_timer : STD_LOGIC;
signal one_hz_enable : STD_LOGIC := '0';
signal clock : STD_LOGIC := '0';
signal reset_sync : STD_LOGIC;
signal expired : STD_LOGIC;

begin

uut_1 : timer
    port map ( value => value,
               start_timer => start_timer,
               one_hz_enable => one_hz_enable,
               clock => clock,
               reset_sync => reset_sync,
               expired => expired );

clock <= not clock after 10ns;
one_hz_enable <= not one_hz_enable after 20ns;

stimuli : process
    begin
        value <= "0000";
        start_timer <= '0';
        reset_sync <= '0';
        wait for 30ns;
        value <= "0100";
        start_timer <= '1';
        reset_sync <= '0';
        wait for 30ns;
        start_timer <= '0';
        reset_sync <= '0';
        wait for 300ns;
        start_timer <= '0';
        reset_sync <= '1';
        wait for 30ns;
        start_timer <= '0';
        reset_sync <= '0';
        wait;
    end process;
end Behavioral;
