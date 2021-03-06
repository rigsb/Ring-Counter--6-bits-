library ieee;
use ieee.std_logic_1164.all;

entity comp_rc is
  generic(m : std_logic_vector(0 to 5) := "011101");
  port (rstm, clk : in std_logic;
         y       : out std_logic_vector(0 to 5));
end comp_rc;

architecture arch_rc of comp_rc is
  component ring_counter_6bit
   port ( clk : in    std_logic; 
          Rst : in    std_logic_vector (0 to 5); 
          Set : in    std_logic_vector (0 to 5); 
          Q   : out   std_logic_vector (0 to 5));
  end component;

  signal rcr, rcs : std_logic_vector(0 to 5);
begin
  process (rstm)
  begin
    if (rstm = '1') then
      rcs <= m;
      rcr <= not m;
      else
        rcr<=(others=>'0');
        rcs<=(others=>'0');
      end if;
    end process;
      C1 : ring_counter_6bit
        port map (clk,rcr,rcs,y);
      end arch_rc;