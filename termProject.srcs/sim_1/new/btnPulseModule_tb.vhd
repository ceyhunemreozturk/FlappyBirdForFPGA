library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity btnPulseModule_tb is
end;

architecture bench of btnPulseModule_tb is

  component btnPulseModule
      Port ( btn : in  STD_LOGIC;
             clk : in  STD_LOGIC;
             reset : in  STD_LOGIC;
             buttonPulse : out  STD_LOGIC);
  end component;

  signal btn: STD_LOGIC;
  signal clk: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal buttonPulse: STD_LOGIC;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: btnPulseModule port map ( btn         => btn,
                                 clk         => clk,
                                 reset       => reset,
                                 buttonPulse => buttonPulse );

  stimulus: process
  begin
    -- Put initialisation code here
      btn <= '0';
      reset <= '0';
      wait for 5 ns;
      btn <= '1';
      wait for 15 ns;
      reset <= '1';
      wait for 10 ns;
      btn <= '0';
      wait for 5 ns;
  
      -- Put test bench stimulus code here
    

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
    
