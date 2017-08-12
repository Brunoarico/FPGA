LIBRARY ieee;
	USE ieee.std_logic_1164.ALL;
	USE ieee.numeric_std.ALL;
	USE ieee.std_logic_arith.ALL;

	
ENTITY Contador8bits IS

	PORT(
		clock : IN STD_LOGIC;
		reset : IN STD_LOGIC := 0;
		led_out : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END ENTITY;

ARCHITECTURE behavior OF Contador8bits IS
BEGIN
	PROCESS(clock, reset)
		VARIABLE clk_counter : INTEGER RANGE 0 to 25000000;
		VARIABLE counter : INTEGER RANGE 0 TO 255;
	BEGIN
		IF(reset = '0') THEN
			counter := 0;
			led_out <= (others => '0');
		ELSIF(RISING_EDGE(clock)) THEN
			IF(clk_counter = 25000000) THEN
				clk_counter := 0;
				counter := counter + 1;
				led_out <= conv_std_logic_vector(counter, 8);
			ELSE
				clk_counter := clk_counter + 1;
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE;