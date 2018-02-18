library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity sevenSegmentDisplayModule_tb is
end;

architecture bench of sevenSegmentDisplayModule_tb is

  component sevenSegmentDisplayModule
  generic(DIVIDING_BITS: natural := 15);
  	port(
  	clk: in std_logic;
  	dataIn: in std_logic_vector(15 downto 0);
  	dpIn: in std_logic_vector(3 downto 0);
  	empty: in std_logic_vector(3 downto 0);
  	seg: out std_logic_vector(6 downto 0);
  	dp: out std_logic;
  	an: out std_logic_vector(3 downto 0)
  	);
  end component;

  signal clk: std_logic;
  signal dataIn: std_logic_vector(15 downto 0);
  signal dpIn: std_logic_vector(3 downto 0);
  signal empty: std_logic_vector(3 downto 0);
  signal seg: std_logic_vector(6 downto 0);
  signal dp: std_logic;
  signal an: std_logic_vector(3 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  -- Insert values for generic parameters !!
  uut: sevenSegmentDisplayModule generic map ( DIVIDING_BITS => 15)
                                    port map ( clk           => clk,
                                               dataIn        => dataIn,
                                               dpIn          => dpIn,
                                               empty         => empty,
                                               seg           => seg,
                                               dp            => dp,
                                               an            => an );

  stimulus: process
  begin
  
     -- Put initialisation code here
     empty <= "0000";
     dpIn <= "0000";
     dataIn <= "0000000000000000";
     -- Put test bench stimulus code here
       for counter in 0 to 15 loop
          dataIn( counter) <= '1';
          wait for 100 us;
       end loop;

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
   
