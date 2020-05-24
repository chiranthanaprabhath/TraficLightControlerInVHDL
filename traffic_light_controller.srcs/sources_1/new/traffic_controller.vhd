----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2020 01:45:42 PM
-- Design Name: 
-- Module Name: traffic_controller - Behavioral
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

entity traffic_controller is
    Port ( reset : in STD_LOGIC;
           sensor : in STD_LOGIC;
           walk_request : in STD_LOGIC;
           reprogram : in STD_LOGIC;
           time_parameter_selector : in STD_LOGIC_VECTOR (1 downto 0);
           time_value : in STD_LOGIC_VECTOR (3 downto 0);
           clock : in STD_LOGIC;
           leds : out STD_LOGIC_VECTOR (6 downto 0));
end traffic_controller;

architecture Behavioral of traffic_controller is

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

component divider is
    Port ( reset_sync : in STD_LOGIC;
           clock : in STD_LOGIC;
           one_hz_enable : out STD_LOGIC);
end component;

component time_parameter is
    Port ( reset_sync : in STD_LOGIC;
           prog_sync : in STD_LOGIC;
           para_selector : in STD_LOGIC_VECTOR (1 downto 0);
           time_value : in STD_LOGIC_VECTOR (3 downto 0);
           interval : in STD_LOGIC_VECTOR (1 downto 0);
           value : out STD_LOGIC_VECTOR (3 downto 0);
           clock : in STD_LOGIC);
end component;

component timer is
    Port ( value : in STD_LOGIC_VECTOR (3 downto 0);
           start_timer : in STD_LOGIC;
           one_hz_enable : in STD_LOGIC;
           clock : in STD_LOGIC;
           reset_sync : in STD_LOGIC;
           expired : out STD_LOGIC);
end component;

component walk_register is
    Port ( wr_sync : in STD_LOGIC;
           wr_reset : in STD_LOGIC;
           wr : out STD_LOGIC);
end component;

signal reset_sync : STD_LOGIC;
signal sensor_sync : STD_LOGIC;
signal wr_sync : STD_LOGIC;
signal prog_sync : STD_LOGIC;
signal start_timer : STD_LOGIC;
signal expired : STD_LOGIC;
signal interval : STD_LOGIC_VECTOR ( 1 downto 0 );
signal value : STD_LOGIC_VECTOR ( 3 downto 0 );
signal wr_reset : STD_LOGIC;
signal wr : STD_LOGIC;
signal one_hz_enable : STD_LOGIC;

begin

fsm_1 : fsm 
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

synchronizer_1 : synchronizer
    port map (reset => reset,
              sensor => sensor,
              walk_request => walk_request,
              reprogram => reprogram,
              clock =>clock,
              reset_sync => reset_sync,
              sensor_sync => sensor_sync,
              wr_sync => wr_sync,
              prog_sync => prog_sync);
              
divider_1 : divider
    port map ( reset_sync => reset_sync,
               clock => clock,
               one_hz_enable => one_hz_enable);

time_parameter_1 : time_parameter
    port map ( reset_sync => reset_sync,
               prog_sync => prog_sync,
               para_selector => time_parameter_selector,
               time_value => time_value,
               interval => interval,
               value => value,
               clock => clock);

timer_1 : timer
    port map ( value => value,
               start_timer => start_timer,
               one_hz_enable => one_hz_enable,
               clock => clock,
               reset_sync => reset_sync,
               expired => expired );

walk_register_1 : walk_register
    port map (wr_sync => wr_sync,
              wr_reset => wr_reset,
              wr => wr);

end Behavioral;
