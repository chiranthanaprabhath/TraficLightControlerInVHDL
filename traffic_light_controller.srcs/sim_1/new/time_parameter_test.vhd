----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2020 01:42:01 PM
-- Design Name: 
-- Module Name: time_parameter_test - Behavioral
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

entity time_parameter_test is
--  Port ( );
end time_parameter_test;

architecture Behavioral of time_parameter_test is

component time_parameter is
    Port ( reset_sync : in STD_LOGIC;
           prog_sync : in STD_LOGIC;
           para_selector : in STD_LOGIC_VECTOR (1 downto 0);
           time_value : in STD_LOGIC_VECTOR (3 downto 0);
           interval : in STD_LOGIC_VECTOR (1 downto 0);
           value : out STD_LOGIC_VECTOR (3 downto 0);
           clock : in STD_LOGIC);
end component;

signal reset_sync : STD_LOGIC;
signal prog_sync : STD_LOGIC;
signal para_selector : STD_LOGIC_VECTOR (1 downto 0);
signal time_value : STD_LOGIC_VECTOR (3 downto 0);
signal interval : STD_LOGIC_VECTOR (1 downto 0);
signal value : STD_LOGIC_VECTOR (3 downto 0);
signal clock : STD_LOGIC;

begin

uut_1 : time_parameter
    port map ( reset_sync => reset_sync,
               prog_sync => prog_sync,
               para_selector => para_selector,
               time_value => time_value,
               interval => interval,
               value => value,
               clock => clock);

stimuli : process
    begin
        clock <= '0';
        reset_sync <= '0';
        prog_sync <= '0';
        para_selector <= "00";
        time_value <= "0000";
        interval <= "00";
        wait for 1ns;
        clock <= '1';
        reset_sync <= '0';
        prog_sync <= '0';
        para_selector <= "00";
        time_value <= "0000";
        interval <= "00";
        wait for 1ns;
        clock <= '0';
        reset_sync <= '0';
        prog_sync <= '0';
        para_selector <= "00";
        time_value <= "0000";
        interval <= "00";
        wait for 1ns;
        clock <= '1';
        reset_sync <= '0';
        prog_sync <= '0';
        para_selector <= "00";
        time_value <= "0000";
        interval <= "01";
        wait for 1ns;
        clock <= '0';
        reset_sync <= '0';
        prog_sync <= '0';
        para_selector <= "00";
        time_value <= "0000";
        interval <= "00";
        wait for 1ns;
        clock <= '1';
        reset_sync <= '0';
        prog_sync <= '0';
        para_selector <= "00";
        time_value <= "0000";
        interval <= "10";
        wait for 1ns;
        clock <= '0';
        reset_sync <= '0';
        prog_sync <= '0';
        para_selector <= "00";
        time_value <= "0000";
        interval <= "01";
        wait for 1ns;
        clock <= '1';
        reset_sync <= '0';
        prog_sync <= '1';
        para_selector <= "00";
        time_value <= "1000";
        interval <= "01";
        wait for 1ns;
        clock <= '0';
        reset_sync <= '0';
        prog_sync <= '0';
        para_selector <= "00";
        time_value <= "0000";
        interval <= "00";
        wait for 1ns;
        clock <= '1';
        reset_sync <= '0';
        prog_sync <= '0';
        para_selector <= "00";
        time_value <= "0000";
        interval <= "00";
        wait for 1ns;
        clock <= '0';
        reset_sync <= '0';
        prog_sync <= '0';
        para_selector <= "00";
        time_value <= "0000";
        interval <= "01";
        wait for 1ns;
        clock <= '1';
        reset_sync <= '1';
        prog_sync <= '0';
        para_selector <= "00";
        time_value <= "0000";
        interval <= "00";
        wait for 1ns;
        clock <= '0';
        reset_sync <= '0';
        prog_sync <= '0';
        para_selector <= "00";
        time_value <= "0000";
        interval <= "00";
        wait for 1ns;
        clock <= '1';
        reset_sync <= '0';
        prog_sync <= '0';
        para_selector <= "00";
        time_value <= "0000";
        interval <= "00";
        wait;
    end process;
end Behavioral;
