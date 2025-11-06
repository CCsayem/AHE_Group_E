----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.11.2025 15:40:26
-- Design Name: 
-- Module Name: Full_adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Full_adder is
  Port (
    Ax : in std_logic;
    Bx  : in std_logic;
    Cin : in std_logic;
    
    Sx : out std_logic;
    Cout : out std_logic);
    
end Full_adder;

architecture Behavioral of Full_adder is

begin
    -- Sum output 
    Sx <= Ax xor Bx xor Cin;
    Cout <= (Ax and Bx ) or (Ax and Cin) or (Bx and Cin); 

end Behavioral;
