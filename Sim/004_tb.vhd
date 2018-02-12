library ieee;
use ieee.std_logic_1164.all;

entity test is
end test;

architecture arch_test of test is
component comp_rc
 -- generic(m : std_logic_vector(0 to 5) := "011101");
  port (rstm, clk : in std_logic;
         y       : out std_logic_vector(0 to 5));
end component;
		  signal tclk,tr: std_logic;
		  signal tq: std_logic_vector(0 to 5);
begin
T1: comp_rc
port map(tr,tclk,tq);

clk1: process
begin
tclk<='1';
wait for 10 ns;
tclk<='0';
wait for 10 ns;
end process;

test1: process
begin
tr<='1';
wait for 10 ns;

tr<='0';
wait for 10 ns;

tr<='1';
wait for 10 ns;

tr<='1';
wait for 10 ns;

tr<='0';
wait for 10 ns;
wait;
end process;


end arch_test;