
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:28:44 02/16/2024
-- Design Name:   vendingmachine
-- Module Name:   vmtb.vhd
-- Project Name:  vendingmachine
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: vendingmachine
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY vmtb_vhd IS
END vmtb_vhd;

ARCHITECTURE behavior OF vmtb_vhd IS 
	constant CLK_PERIOD: time  := 10 ns;
	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT vendingmachine
	PORT(
		clk : IN std_logic;
		rstn : IN std_logic;
		cashIn : IN std_logic_vector(1 downto 0);          
		coffee : OUT std_logic;
		cashOut : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL clk :  std_logic := '0';
	SIGNAL rstn :  std_logic := '0';
	SIGNAL cashIn :  std_logic_vector(1 downto 0) := (others=>'0');

	--Outputs
	SIGNAL coffee :  std_logic;
	SIGNAL cashOut :  std_logic_vector(1 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: vendingmachine PORT MAP(
		clk => clk,
		rstn => rstn,
		cashIn => cashIn,
		coffee => coffee,
		cashOut => cashOut
	);
CLK_process: process
    begin
        while now < 200 ns loop
            CLK <= '0';
            wait for CLK_PERIOD/2;
            CLK <= '1';
            wait for CLK_PERIOD/2;
        end loop;
        wait;
    end process CLK_process;
	 
	tb : PROCESS
	BEGIN
	 -- Reset
        rstn <= '0';
        wait for CLK_PERIOD;
        rstn <= '1';

        wait for CLK_PERIOD;

        -- Scenario 1: No money
        cashIn <= "00";
        wait for CLK_PERIOD * 2;
        
        -- Scenario 2: Insert 10 followed by another 10
        cashIn <= "01";
        wait for CLK_PERIOD;
        cashIn <= "01";
        wait for CLK_PERIOD * 2;
        
        -- Scenario 3: Insert 10 followed by 20
        cashIn <= "01";
        wait for CLK_PERIOD;
        cashIn <= "10";
        wait for CLK_PERIOD * 2;
        
        -- Scenario 4: Insert 10 followed by 50
        cashIn <= "01";
        wait for CLK_PERIOD;
        cashIn <= "11";
        wait for CLK_PERIOD * 2;
        
        -- Scenario 5: Insert 20
        cashIn <= "10";
        wait for CLK_PERIOD * 2;

        -- End simulation
        wait;

	END PROCESS;

END;
