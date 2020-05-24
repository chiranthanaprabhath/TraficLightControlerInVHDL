----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2020 09:20:58 PM
-- Design Name: 
-- Module Name: synchronizer_test - Behavioral
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

entity synchronizer_test is
--  Port ( );
end synchronizer_test;

architecture Behavioral of synchronizer_test is

component synchronizer is
    Port ( reset : in STD_LOGIC;
           sensor : in STD_LOGIC;
           walk_request : in STD_LOGIC;
           reprogram : in STD_LOGIC;
           clock : in STD_LOGIC;
           reset_sync : out STD_LOGIC;
           sensor_sync : out STD_LOGIC;
           wr_sync : out STD_LOGIC;
           prog_sync : out STD_LOGIC);
end component;

signal reset : STD_LOGIC;
signal sensor : STD_LOGIC;
signal walk_request : STD_LOGIC;
signal reprogram : STD_LOGIC;
signal clock : STD_LOGIC;
signal reset_sync : STD_LOGIC;
signal sensor_sync : STD_LOGIC;
signal wr_sync : STD_LOGIC;
signal prog_sync : STD_LOGIC;

begin

uut_1 : synchronizer
    port map (reset => reset,
              sensor => sensor,
              walk_request => walk_request,
              reprogram => reprogram,
              clock =>clock,
              reset_sync => reset_sync,
              sensor_sync => sensor_sync,
              wr_sync => wr_sync,
              prog_sync => prog_sync);

stimuli : process
    begin
        clock <= '0';
        reset <= '0';
        sensor <= '0';
        walk_request <= '0';
        reprogram <= '0';
        wait for 100ns;
        clock <= '1';
        reset <= '0';
        sensor <= '0';
        walk_request <= '0';
        reprogram <= '0';
        wait for 100ns;
        clock <= '0';
        reset <= '0';
        sensor <= '0';
        walk_request <= '0';
        reprogram <= '0';
        wait for 100ns;
        clock <= '1';
        reset <= '1';
        sensor <= '1';
        walk_request <= '1';
        reprogram <= '1';
        wait for 100ns;
        clock <= '0';
        reset <= '0';
        sensor <= '0';
        walk_request <= '0';
        reprogram <= '0';
        wait for 100ns;
        clock <= '1';
        reset <= '0';
        sensor <= '0';
        walk_request <= '0';
        reprogram <= '0';
        wait;
    end process;


end Behavioral;
