----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2020 10:56:34 AM
-- Design Name: 
-- Module Name: fsm_test - Behavioral
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

entity fsm_test is
--  Port ( );
end fsm_test;

architecture Behavioral of fsm_test is

component fsm is
    Port ( sensor_sync : in STD_LOGIC;
           wr : in STD_LOGIC;
           prog_sync : in STD_LOGIC;
           reset_sync : in STD_LOGIC;
           clock : in STD_LOGIC;
           expired : in STD_LOGIC;
           wr_reset : out STD_LOGIC;
           interval : out STD_LOGIC_VECTOR (1 downto 0);
           start_timer : out STD_LOGIC;
           leds : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal sensor_sync : STD_LOGIC;
signal wr : STD_LOGIC;
signal prog_sync : STD_LOGIC;
signal reset_sync : STD_LOGIC;
signal clock : STD_LOGIC := '0';
signal expired : STD_LOGIC;
signal wr_reset : STD_LOGIC;
signal interval : STD_LOGIC_VECTOR (1 downto 0);
signal start_timer : STD_LOGIC;
signal leds : STD_LOGIC_VECTOR (6 downto 0);

begin

uut_1 : fsm 
    port map ( sensor_sync => sensor_sync,
               wr => wr,
               prog_sync => prog_sync,
               reset_sync => reset_sync,
               clock => clock,
               expired => expired,
               wr_reset => wr_reset,
               interval => interval,
               start_timer => start_timer,
               leds => leds );

clock <= not clock after 10ns;

stimuli : process
    begin
        sensor_sync <= '0';
        wr <= '0';
        prog_sync <= '0';
        reset_sync <= '0';
        wait for 5ns;
        reset_sync <= '1';
        wait for 10 ns;
        reset_sync <= '0';
        wait for 25ns;
        expired <= '1';
        wait for 20ns;
        expired <= '0';
        wait for 40ns;
        expired <= '1';
        wait for 20ns;
        expired <= '0';
        wait for 40ns;
        expired <= '1';
        wait for 20ns;
        expired <= '0';
        wait for 40ns;
        expired <= '1';
        wait for 20ns;
        expired <= '0';
        wait for 40ns;
        expired <= '1';
        wait for 20ns;
        expired <= '0';
        wr <= '1';
        wait for 40ns;
        expired <= '1';
        wait for 20ns;
        expired <= '0';
        wait for 40ns;
        expired <= '1';
        wait for 20ns;
        expired <= '0';
        wait for 40ns;
        expired <= '1';
        wait for 20ns;
        expired <= '0';
        wait for 40ns;
        expired <= '1';
        wait for 20ns;
        expired <= '0';
        wait for 40ns;
        expired <= '1';
        wait for 20ns;
        expired <= '0';
        wait;
    end process;

end Behavioral;
