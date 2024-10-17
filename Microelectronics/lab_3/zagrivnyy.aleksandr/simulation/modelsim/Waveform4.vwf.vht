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
-- Generated on "10/17/2024 22:46:40"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          d-trigger
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY d-trigger_vhd_vec_tst IS
END d-trigger_vhd_vec_tst;
ARCHITECTURE d-trigger_arch OF d-trigger_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL D : STD_LOGIC;
SIGNAL L : STD_LOGIC;
SIGNAL Q : STD_LOGIC;
SIGNAL QB : STD_LOGIC;
COMPONENT d-trigger
	PORT (
	D : IN STD_LOGIC;
	L : IN STD_LOGIC;
	Q : OUT STD_LOGIC;
	QB : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : d-trigger
	PORT MAP (
-- list connections between master ports and signals
	D => D,
	L => L,
	Q => Q,
	QB => QB
	);

-- D
t_prcs_D: PROCESS
BEGIN
	D <= '0';
	WAIT FOR 10000 ps;
	D <= '1';
	WAIT FOR 60000 ps;
	D <= '0';
	WAIT FOR 70000 ps;
	D <= '1';
	WAIT FOR 80000 ps;
	D <= '0';
WAIT;
END PROCESS t_prcs_D;

-- L
t_prcs_L: PROCESS
BEGIN
	L <= '0';
	WAIT FOR 50000 ps;
	L <= '1';
	WAIT FOR 100000 ps;
	L <= '0';
WAIT;
END PROCESS t_prcs_L;
END d-trigger_arch;
