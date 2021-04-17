# FPGA-Repo
This project covers VHDL Discription of a finite state mealy machine, This designed to recognises a binary sequence 01101110 and can be modified for any sequence. The Hint output is 1 when the input is correct for any state and the UNLK output is 1 only when at the final state and the current input is 0.
The reset is designed to be active-low. i.e only operates if it's active on the clock's rising edge, finally the machine changes state only on the clock's rising edge.
