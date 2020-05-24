----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2020 08:59:27 PM
-- Design Name: 
-- Module Name: timer - Behavioral
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

entity timer is
    Port ( value : in STD_LOGIC_VECTOR (3 downto 0);
           start_timer : in STD_LOGIC;
           one_hz_enable : in STD_LOGIC;
           clock : in STD_LOGIC;
           reset_sync : in STD_LOGIC;
           expired : out STD_LOGIC);
end timer;

architecture Behavioral of timer is

begin
   process ( clock, Start_Timer, one_hz_enable, Reset_Sync, Value )
        variable Time_Left : integer := 0;
        variable Timer_Started : STD_LOGIC := '0';
        variable delayForTwo : integer :=0;
        variable Expire_Active : STD_LOGIC := '0';
        begin
            if rising_edge(clock) then
                if (Expire_Active = '1') then
                    Expired <= '0';
                    Expire_Active := '0';
                end if;
                if (( Start_Timer = '1' ) and delayForTwo = 0 ) then
                    delayForTwo := delayForTwo + 1;
                    Expired <= '0';
                elsif ( delayForTwo = 1) then
                    delayForTwo := delayForTwo + 1;                    
                elsif ( delayForTwo = 2 ) then
                    Time_Left := to_integer(unsigned(Value));
                    delayForTwo := 0;
                 end if;
            end if;
            if ( one_hz_enable 'event and one_hz_enable = '1') then
                if Time_Left /= 0 then
                    Time_Left := Time_Left - 1;
                end if;
                if Time_Left = 0 then
                    Expired <= '1';
                    Expire_Active := '1';
                end if;
            end if;
        end process;

end Behavioral;
