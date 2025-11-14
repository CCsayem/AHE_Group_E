library ieee;
use ieee.std_logic_1164.all;

-- This is the entity for our testbench. It's empty.
entity counter_tb is
end entity counter_tb;

architecture tb_behav of counter_tb is

    -- 1. Component Declaration
    -- This now matches YOUR wrapper name from the screenshot
    component counter_circuit_4_bit_wrapper
        port (
            clk     : in std_logic;
            en      : in std_logic;
            rst     : in std_logic;
            up_down : in std_logic;
            q_out   : out std_logic_vector(3 downto 0)
        );
    end component;

    -- 2. Signals
    -- These are the "wires" inside the testbench
    signal tb_clk     : std_logic := '0';
    signal tb_rst     : std_logic;
    signal tb_en      : std_logic;
    signal tb_up_down : std_logic;
    signal tb_q_out   : std_logic_vector(3 downto 0);

    -- Clock constant (10 ns period = 100 MHz)
    constant CLK_PERIOD : time := 10 ns;

begin

    -- 3. Instantiate the Unit Under Test (UUT)
    -- This also matches YOUR wrapper name
    uut : counter_circuit_4_bit_wrapper
        port map (
            clk     => tb_clk,
            rst     => tb_rst,
            en      => tb_en,
            up_down => tb_up_down,
            q_out   => tb_q_out
        );

    -- 4. Clock Generation Process
    clk_process : process
    begin
        tb_clk <= '0';
        wait for CLK_PERIOD / 2;
        tb_clk <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- 5. Stimulus Process
    stim_process : process
    begin
        -- Start with reset
        tb_rst <= '1';
        tb_en <= '0';
        tb_up_down <= '0';
        wait for 100 ns; -- Hold reset for 100 ns

        -- Release reset, counter should be 0
        tb_rst <= '0';
        wait for 20 ns;

        -- Test 1: Enable counting UP
        tb_en <= '1';
        tb_up_down <= '1';
        wait for 200 ns; -- Let it count up for 20 clock cycles

        -- Test 2: Stop counting
        tb_en <= '0';
        wait for 50 ns; -- Counter value should hold steady

        -- Test 3: Enable counting DOWN
        tb_en <= '1';
        tb_up_down <= '0';
        wait for 200 ns; -- Let it count down for 20 clock cycles

        -- Test 4: Reset again
        tb_rst <= '1';
        wait for 50 ns;
        tb_rst <= '0';
        
        -- End of simulation
        wait;
    end process;

end architecture tb_behav;