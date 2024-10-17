LIBRARY ieee;						-- подключение библиотеки ieee
USE ieee.std_logic_1164.ALL;	-- использование библиотечного
										-- модуля, содержащего
										-- дополнительные типы переменных.
ENTITY notand IS
PORT(a: IN std_logic;			-- описание входов и выходов
 b: IN std_logic;					-- устройства (IN — вход, OUT —
 c: OUT std_logic );				-- выход, INOUT — двунаправленный
END notand;							-- сигнал)
ARCHITECTURE behavior OF notand IS
BEGIN
 C <= NOT ( a AND b );
END behavior;
