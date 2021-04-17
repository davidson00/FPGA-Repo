Library ieee;
Use ieee.std_logic_1164.ALL;
entity Ica is
		port (clk: in bit;   --clock declaration
				X: in bit;   -- input declaration
				reset: in bit; --reset declaration
				UNLK,Hint:	out bit); --UNLK and Hint declaration
end Ica;
architecture rtl of Ica is
type state_type is (sA, sB, sC, sD, sE, sF, sG, sH); -- Declaration of the different states of the machine
signal state: state_type;
	begin
		process (clk) -- Clk as part of the sensitivity list since the machine changes state on the clock's rising edge
			begin
			if clk'event and clk = '1' then --Check the clock's rising edge
				if reset = '0' then state <= sA;  --if reset is active the machine to is moved to initial state sA  
				else --if reset isn't active
				case state is --determine the nextstate based on the current state and the input, also set the hint and Unlk output
					when sA => if X = '0' then state <= sB; 
					else state <= sA;
					end if;
					when sB => if X = '1' then state <= sC; 
					else state <= sB;
					end if;
					when sC => if X = '1' then state <= sD; 
					else state <= sB; 
					end if;
					when sD => if X = '0' then state <= sE; 
					else state <= sA; 
					end if;
					when sE => if X = '1' then state <= sF; 
					else state <= sB; 
					end if;
					when sF => if X = '1' then state <= sG; 
					else state <= sB; 
					end if;
					when sG => if X = '1' then state <= sH; 
					else state <= sE;
					end if;
					when sH => if X = '0' then state <= sB;
					else state <= sA;
					end if;
				 end case;
				end if;
			end if;
		end process;
		
		process (state,X) -- Combinational process
		begin
		case state is  --this process assigns the output values based on the current state and the current input
				when sA => if X = '0' then
				Hint<= '1'; UNLK <= '0';
				else  Hint<= '0'; UNLK <= '0';
				end if;
				when sB => if X = '1' then 
				Hint<= '1'; UNLK <= '0';
				else Hint<= '0'; UNLK <= '0';
				end if;
				when sC => if X = '1' then
				Hint<= '1'; UNLK <= '0';
				else Hint<= '0'; UNLK <= '0';
				end if;
				when sD => if X = '0' then
				Hint<= '1'; UNLK <= '0';
				else
				Hint<= '0'; UNLK <= '0';
				end if;
				when sE => if X = '1' then
				Hint<= '1'; UNLK <= '0';
				else Hint<= '0'; UNLK <= '0';
				end if;
				when sF => if X = '1' then
				Hint<= '1'; UNLK <= '0';
				else Hint<= '0'; UNLK <= '0';
				end if;
				when sG => if X = '1' then
				Hint<= '1'; UNLK <= '0';
				else Hint<= '0'; UNLK <= '0';
				end if;
				when sH => if X = '0' then
				Hint<= '1'; UNLK <= '1'; 
				else Hint<= '0'; UNLK <= '0';
				end if;
			end case;
	end process;

end rtl;

