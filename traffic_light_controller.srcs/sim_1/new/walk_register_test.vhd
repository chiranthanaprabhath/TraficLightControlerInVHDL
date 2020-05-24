----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2020 08:30:41 PM
-- Design Name: 
-- Module Name: walk_register_test - Behavioral
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

entity walk_register_test is
--  Port ( );
end walk_register_test;

architecture Behavioral of walk_register_test is

component walk_register is
    Port ( wr_sync : in STD_LOGIC;
           wr_reset : in STD_LOGIC;
           wr : out STD_LOGIC);
end component;

signal p : STD_LOGIC;
signal q : STD_LOGIC;
signal r : STD_LOGIC;

begin

uut_1 : walk_register
    port map (wr_sync => p,
              wr_reset => q,
              wr => r);

stimuli : process
    begin
        q <= '1';
        wait for 100ns;
        q <= '0';
        wait for 100ns;
        p <= '1';
        wait for 100ns;
        p <= '0';
        wait for 400ns;
        q <= '1';
        wait;
    end process;

end Behavioral;
