LIBRARY ieee;
	USE ieee.std_logic_1164.ALL;
	USE ieee.numeric_std.ALL;

ENTITY Blink IS
	PORT(
		clk_in : IN STD_LOGIC;
		led_out : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END ENTITY;

ARCHITECTURE behavior OF Blink IS
	SIGNAL led_off : STD_LOGIC_VECTOR (7 downto 0);
BEGIN
	PROCESS(clk_in)
		VARIABLE counter : INTEGER RANGE 0 to 25000000;
	BEGIN
		IF(RISING_EDGE(clk_in)) THEN
			IF(counter = 25000000) THEN
				counter := 0;
				led_off <= NOT led_off;
			ELSE
				counter := counter + 1;
			END IF;
		END IF;
	END PROCESS;
	
	led_out <= led_off;
END ARCHITECTURE;