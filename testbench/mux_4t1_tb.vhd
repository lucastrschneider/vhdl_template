library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux_4t1_tb is
end mux_4t1_tb;

architecture mux_4t1_tb_arch of mux_4t1_tb is

    component mux_4t1 is 
    generic (n: positive);
    port (
        SEL:    in  std_logic_vector(1 downto 0);
        D0, D1,
        D2, D3: in  std_logic_vector(n-1 downto 0);
        F:      out std_logic_vector(n-1 downto 0)
    );
    end component;
            
    constant SIZE: positive := 8;
    signal sel_in: std_logic_vector(1 downto 0);
    signal d0_in, d1_in, d2_in, d3_in, f_out: std_logic_vector(SIZE-1 downto 0);

    begin
        cp1: mux_4t1 generic map (SIZE) port map (sel_in, d0_in, d1_in, d2_in, d3_in, f_out);

        main: process
        begin
            report "BOOT";

            d0_in <= "00101101";
            d1_in <= "10100001";
            d2_in <= "00100000";
            d3_in <= "10111101";

            sel_in <= "00";
            wait for 1 ns;
            assert(f_out="00101101") report "Fail 01" severity error;

            sel_in <= "01";
            wait for 1 ns;
            assert(f_out=d1_in) report "Fail 02" severity error;

            sel_in <= "10";
            wait for 1 ns;
            assert(f_out=d2_in) report "Fail 03" severity error;

            sel_in <= "11";
            wait for 1 ns;
            assert(f_out=d3_in) report "Fail 04" severity error;

            d3_in <= "11111111";
            wait for 1 ns;
            assert(f_out="11111111") report "Fail 05" severity error;

            sel_in <= "10";
            wait for 1 ns;
            assert(f_out="00100000") report "Fail 06" severity error;

            report "EOT";
            wait;
        end process;
end architecture mux_4t1_tb_arch;
