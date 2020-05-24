----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2020 08:06:57 PM
-- Design Name: 
-- Module Name: traffic_controller_test - Behavioral
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

entity traffic_controller_test is
--  Port ( );
end traffic_controller_test;

architecture Behavioral of traffic_controller_test is

component traffic_controller is
    Port ( reset : in STD_LOGIC;
           sensor : in STD_LOGIC;
           walk_request : in STD_LOGIC;
           reprogram : in STD_LOGIC;
           time_parameter_selector : in STD_LOGIC_VECTOR (1 downto 0);
           time_value : in STD_LOGIC_VECTOR (3 downto 0);
           clock : in STD_LOGIC;
           leds : out STD_LOGIC_VECTOR (6 downto 0) );
end component;

signal reset : STD_LOGIC;
signal sensor : STD_LOGIC;
signal walk_request : STD_LOGIC;
signal reprogram : STD_LOGIC;
signal time_parameter_selector : STD_LOGIC_VECTOR (1 downto 0);
signal time_value : STD_LOGIC_VECTOR (3 downto 0);
signal clock : STD_LOGIC := '0';
signal leds : STD_LOGIC_VECTOR (6 downto 0);


begin

uut_1 : traffic_controller
    port map ( reset => reset,
               sensor => sensor,
               walk_request => walk_request,
               reprogram => reprogram,
               time_parameter_selector => time_parameter_selector,
               time_value => time_value,
               clock => clock,
               leds => leds);

clock <= not clock after 10ns;

stimuli : process
    begin
        reset <= '0';
        sensor <= '0';
        walk_request <= '0';
        reprogram <= '0';

        wait;
    end process;

end Behavioral;
