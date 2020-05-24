----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2020 10:01:42 PM
-- Design Name: 
-- Module Name: fsm - Behavioral
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

entity fsm is
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
end fsm;

architecture Behavioral of fsm is

type state is (A,B,C,D,E);
signal led_state : state;
constant t_base : STD_LOGIC_VECTOR (1 downto 0) := "00";
constant t_ext : STD_LOGIC_VECTOR (1 downto 0) := "01";
constant t_yel : STD_LOGIC_VECTOR (1 downto 0) := "10";

begin
    process (clock, wr, sensor_sync, prog_sync, reset_sync, expired)
        variable Extended_Time : integer := 0;
        begin
            if rising_edge(clock) then
                start_timer <= '0';
                if ( prog_sync = '1' or reset_sync = '1' ) then
                    led_state <= A;
                    interval <= t_base;
                    wr_reset <= '0';
                    start_timer <= '1';
                    Extended_Time := 0;
                elsif expired = '1' then
                    case led_state is
                        when A =>
                            if ( Extended_Time = 0 and sensor_sync = '0' ) then
                                interval <= t_base;
                                Extended_Time := 1;
                                start_timer <= '1';
                            elsif ( Extended_Time = 0 and sensor_sync = '1' ) then
                                interval <= t_ext;
                                start_timer <= '1';
                                Extended_Time := 1;
                            else
                                led_state <= B;
                                interval <= t_yel;
                                start_timer <= '1';
                                Extended_Time := 0;
                            end if;
                        when B =>
                            if wr = '1' then
                                led_state <= E;
                                interval <= t_ext;
                                start_timer <= '1';
                            else
                                led_state <= C;
                                interval <= t_base;
                                start_timer <= '1';
                            end if;
                        when C =>
                            wr_reset <= '0';
                            if ( Extended_Time = 0 and sensor_sync = '1' ) then
                                interval <= t_ext;
                                start_timer <= '1';
                                Extended_Time := 1;
                            else
                                led_state <= D;
                                interval <= t_yel;
                                start_timer <= '1';
                                Extended_Time := 0;
                            end if;
                        when D =>
                            led_state <= A;
                            interval <= t_base;
                            start_timer <= '1';
                            Extended_Time := 0;
                        when E =>
                            led_state <= C;
                            interval <= t_yel;
                            start_timer <= '1';
                            wr_reset <= '1';
                        when others =>
                            led_state <= A;
                            interval <= t_base;
                            start_timer <= '1';
                            wr_reset <= '0';
                            Extended_Time := 0;
                    end case;
                end if;
            end if;
        end process;
        
        process ( led_state )
            begin
                case led_state is
                    when A=>
                        leds <= "0011000";
                    when B=>
                        leds <= "0101000";
                    when C=>
                        leds <= "1000010";
                    when D=>
                        leds <= "1000100";
                    when E =>
                        leds <= "1001001";
                end case;
        end process;
end Behavioral;
