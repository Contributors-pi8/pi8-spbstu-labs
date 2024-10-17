-- Copyright (C) 2024  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "10/18/2024 01:14:58"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          d_trigger_pov
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY d_trigger_pov_vhd_vec_tst IS
END d_trigger_pov_vhd_vec_tst;
ARCHITECTURE d_trigger_pov_arch OF d_trigger_pov_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL d : STD_LOGIC;
SIGNAL q : STD_LOGIC;
COMPONENT d_trigger_pov
	PORT (
	clk : IN STD_LOGIC;
	d : IN STD_LOGIC;
	q : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : d_trigger_pov
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	d => d,
	q => q
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
	clk <= '0';
	WAIT FOR 30000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 70000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 80000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
WAIT;
END PROCESS t_prcs_clk;

-- d
t_prcs_d: PROCESS
BEGIN
	d <= '0';
	WAIT FOR 50000 ps;
	d <= '1';
	WAIT FOR 100000 ps;
	d <= '0';
WAIT;
END PROCESS t_prcs_d;
END d_trigger_pov_arch;
