-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Tue Feb 27 17:09:53 2024
-- Host        : FIR running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Project/PROF/3_dac_adc_triggered_read/vivado_project_bit/vivado_project_bit.gen/sources_1/ip/selectio_wiz_0/selectio_wiz_0_stub.vhdl
-- Design      : selectio_wiz_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a75tfgg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity selectio_wiz_0 is
  Port ( 
    data_in_from_pins : in STD_LOGIC_VECTOR ( 11 downto 0 );
    data_in_to_device : out STD_LOGIC_VECTOR ( 23 downto 0 );
    clk_in : in STD_LOGIC;
    io_reset : in STD_LOGIC
  );

end selectio_wiz_0;

architecture stub of selectio_wiz_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "data_in_from_pins[11:0],data_in_to_device[23:0],clk_in,io_reset";
begin
end;
