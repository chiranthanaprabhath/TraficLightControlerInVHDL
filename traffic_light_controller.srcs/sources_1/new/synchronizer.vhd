----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2020 08:57:29 PM
-- Design Name: 
-- Module Name: synchronizer - Behavioral
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

entity synchronizer is
    Port ( reset : in STD_LOGIC;
           sensor : in STD_LOGIC;
           walk_request : in STD_LOGIC;
           reprogram : in STD_LOGIC;
           clock : in STD_LOGIC;
           reset_sync : out STD_LOGIC;
           sensor_sync : out STD_LOGIC;
           wr_sync : out STD_LOGIC;
           prog_sync : out STD_LOGIC);
end synchronizer;

architecture Behavioral of synchronizer is

begin
    process (clock) 
        begin
            if rising_edge(clock) then
                reset_sync <= reset;
                sensor_sync <= sensor;
                wr_sync <= walk_request;
                prog_sync <= reprogram;
            end if;
        end process;
end Behavioral;
