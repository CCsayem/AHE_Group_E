library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- Important: for arithmetic on vectors

entity up_down_counter_4bit is
    port (
        clk     : in  std_logic;
        rst     : in  std_logic;
        en      : in  std_logic;
        up_down : in  std_logic; -- '1' for UP, '0' for DOWN
        q_out   : out std_logic_vector(3 downto 0)
    );
end entity up_down_counter_4bit;

architecture rtl of up_down_counter_4bit is
    -- Internal signal to hold the count value.
    -- This signal will become the flip-flops.
    signal count_reg : unsigned(3 downto 0) := (others => '0');

begin

    -- Main synchronous process
    process(clk)
    begin
        if rising_edge(clk) then
            -- 1st priority: Reset
            if rst = '1' then
                count_reg <= (others => '0');
            
            -- 2nd priority: Enable
            elsif en = '1' then
                if up_down = '1' then
                    -- Count UP
                    count_reg <= count_reg + 1;
                else
                    -- Count DOWN
                    count_reg <= count_reg - 1;
                end if;
            end if;
            -- If 'en' is '0', the count_reg holds its value (stopped)
        end if;
    end process;

    -- Assign the internal register to the output port
    -- (converts 'unsigned' type to 'std_logic_vector')
    q_out <= std_logic_vector(count_reg);

end architecture rtl;