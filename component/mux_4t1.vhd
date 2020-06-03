library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux_4t1 is
    generic (
        n: positive
    );
    port (
        SEL:            in  std_logic_vector(1 downto 0);
        D0, D1, D2, D3: in  std_logic_vector(n-1 downto 0);
        F:        out std_logic_vector(n-1 downto 0)
    );
end mux_4t1;

architecture mux_4t1_arch of mux_4t1 is
    begin
        with SEL select
            F <=  D3 when "11",
                        D2 when "10",
                        D1 when "01",
                        D0 when "00",
                        (others => 'X') when others;
    end mux_4t1_arch;