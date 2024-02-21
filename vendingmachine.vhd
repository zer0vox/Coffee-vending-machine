----------------------------------------------------------------------------------
-- Company: Sumip Chaudhary
-- Designer: Sumip Chaudhary
-- 
-- Create Date:    20:08:52 02/16/2024 
-- Design Name: Coffee Vending Machine
-- Module Name:    vendingmachine - Behavioral 
-- Project Name: Vending Machine
-- Target Devices: 
-- Tool versions: 
-- Description: A project for demonstration of a Coffee Vending Machine
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: embedded system -lab final project
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vendingmachine is
    Port ( clk : in  STD_LOGIC;
           rstn : in  STD_LOGIC;
           cashIn : in  STD_LOGIC_VECTOR (1 downto 0);
           coffee : out  STD_LOGIC;
           cashOut : out  STD_LOGIC_VECTOR (1 downto 0));
end vendingmachine;

architecture Behavioral of vendingmachine is
type state_type is ( idle,--start state/reset
 put_money, --waiting to enter money
 in_1,in_3,in_6,in_5, --represent the current sum of money after returning change
 change_1, --should return change of Rs 10
 coffee_out --dispence coffee can.
 ); --type of state machine.
signal current_s,next_s: state_type; --current and next state declaration.

begin
--comb
process(CLK,rstn)
begin
 if(rstn = '0') then
 current_s <= idle; --defualt state is on RESET
 elsif(clk'event and clk = '1') then
 current_s <= next_s;
 end if;
end process;

process(current_s,cashIn)
begin
case current_s is
 when idle => 
 coffee <= '0';
 cashOut <= "00";
 next_s <= put_money;
 when put_money => --wait for money to be entered
 if(cashIn = "00")then
 coffee <= '0';
 cashOut <= "00";
 next_s <= put_money;
 elsif(cashIn = "01")then --insert Rs 10
 coffee <= '0';
 cashOut <= "00";
 next_s <= in_1;
 elsif(cashIn = "10")then --insert Rs 20
 coffee <= '0';
 cashOut <= "00";
 next_s <= coffee_out;
 elsif(cashIn = "11")then --insert Rs 30
 coffee <= '0';
 cashOut <= "00";
 next_s <= in_5;
 end if;
 ------------------------------------------------------
 when in_1 => 
 if(cashIn = "00") then--stay on the same state
 coffee <= '0';
 cashOut <= "00";
 next_s <= in_1;
 elsif(cashIn = "01") then--inserted another 10
 coffee <= '0';
 cashOut <= "00";
 next_s <= coffee_out;
 elsif(cashIn = "10") then--inserted another 20
 coffee <= '0';
 cashOut <= "00";
 next_s <= in_3;
 elsif(cashIn = "11") then
 coffee <= '0';
 cashOut <= "10";
 next_s <= in_6;
 end if;
 ------------------------------------------------------
 when in_3 =>
 coffee <= '0';
 cashOut <= "01";
 next_s <= coffee_out;
 ------------------------------------------------------
 when in_6 =>
 coffee <= '0';
 cashOut <= "01";
 next_s <= in_5;
 ------------------------------------------------------
 when in_5 => -- input = Rs 50
 coffee <= '0';
 cashOut <= "10";
 next_s <= change_1;
 ------------------------------------------------------
 when change_1 => -- input = Rs 50
 coffee <= '0';
 cashOut <= "01";
 next_s <= coffee_out;
 ------------------------------------------------------
 when coffee_out =>
 coffee <= '1';
 cashOut <= "00";
 next_s <= put_money; 
end case;
end process;

end Behavioral;

