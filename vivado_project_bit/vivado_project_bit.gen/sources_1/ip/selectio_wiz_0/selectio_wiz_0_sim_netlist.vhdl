-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Tue Feb 27 17:09:53 2024
-- Host        : FIR running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Project/PROF/3_dac_adc_triggered_read/vivado_project_bit/vivado_project_bit.gen/sources_1/ip/selectio_wiz_0/selectio_wiz_0_sim_netlist.vhdl
-- Design      : selectio_wiz_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a75tfgg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity selectio_wiz_0_selectio_wiz is
  port (
    data_in_from_pins : in STD_LOGIC_VECTOR ( 11 downto 0 );
    data_in_to_device : out STD_LOGIC_VECTOR ( 23 downto 0 );
    clk_in : in STD_LOGIC;
    io_reset : in STD_LOGIC
  );
  attribute DEV_W : integer;
  attribute DEV_W of selectio_wiz_0_selectio_wiz : entity is 24;
  attribute SYS_W : integer;
  attribute SYS_W of selectio_wiz_0_selectio_wiz : entity is 12;
end selectio_wiz_0_selectio_wiz;

architecture STRUCTURE of selectio_wiz_0_selectio_wiz is
  signal data_in_from_pins_int : STD_LOGIC_VECTOR ( 11 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \pins[0].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of \pins[0].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of \pins[0].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of \pins[0].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[0].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ : string;
  attribute \__SRVAL\ of \pins[0].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[10].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[10].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[10].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[10].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[10].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[10].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[11].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[11].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[11].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[11].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[11].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[11].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[1].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[1].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[1].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[1].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[1].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[1].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[2].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[2].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[2].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[2].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[2].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[2].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[3].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[3].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[3].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[3].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[3].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[3].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[4].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[4].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[4].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[4].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[4].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[4].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[5].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[5].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[5].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[5].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[5].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[5].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[6].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[6].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[6].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[6].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[6].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[6].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[7].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[7].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[7].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[7].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[7].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[7].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[8].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[8].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[8].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[8].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[8].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[8].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[9].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[9].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[9].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[9].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[9].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[9].iddr_inst\ : label is "FALSE";
begin
\pins[0].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(0),
      O => data_in_from_pins_int(0)
    );
\pins[0].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_in,
      CE => '1',
      D => data_in_from_pins_int(0),
      Q1 => data_in_to_device(0),
      Q2 => data_in_to_device(12),
      R => io_reset,
      S => '0'
    );
\pins[10].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(10),
      O => data_in_from_pins_int(10)
    );
\pins[10].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_in,
      CE => '1',
      D => data_in_from_pins_int(10),
      Q1 => data_in_to_device(10),
      Q2 => data_in_to_device(22),
      R => io_reset,
      S => '0'
    );
\pins[11].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(11),
      O => data_in_from_pins_int(11)
    );
\pins[11].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_in,
      CE => '1',
      D => data_in_from_pins_int(11),
      Q1 => data_in_to_device(11),
      Q2 => data_in_to_device(23),
      R => io_reset,
      S => '0'
    );
\pins[1].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(1),
      O => data_in_from_pins_int(1)
    );
\pins[1].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_in,
      CE => '1',
      D => data_in_from_pins_int(1),
      Q1 => data_in_to_device(1),
      Q2 => data_in_to_device(13),
      R => io_reset,
      S => '0'
    );
\pins[2].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(2),
      O => data_in_from_pins_int(2)
    );
\pins[2].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_in,
      CE => '1',
      D => data_in_from_pins_int(2),
      Q1 => data_in_to_device(2),
      Q2 => data_in_to_device(14),
      R => io_reset,
      S => '0'
    );
\pins[3].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(3),
      O => data_in_from_pins_int(3)
    );
\pins[3].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_in,
      CE => '1',
      D => data_in_from_pins_int(3),
      Q1 => data_in_to_device(3),
      Q2 => data_in_to_device(15),
      R => io_reset,
      S => '0'
    );
\pins[4].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(4),
      O => data_in_from_pins_int(4)
    );
\pins[4].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_in,
      CE => '1',
      D => data_in_from_pins_int(4),
      Q1 => data_in_to_device(4),
      Q2 => data_in_to_device(16),
      R => io_reset,
      S => '0'
    );
\pins[5].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(5),
      O => data_in_from_pins_int(5)
    );
\pins[5].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_in,
      CE => '1',
      D => data_in_from_pins_int(5),
      Q1 => data_in_to_device(5),
      Q2 => data_in_to_device(17),
      R => io_reset,
      S => '0'
    );
\pins[6].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(6),
      O => data_in_from_pins_int(6)
    );
\pins[6].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_in,
      CE => '1',
      D => data_in_from_pins_int(6),
      Q1 => data_in_to_device(6),
      Q2 => data_in_to_device(18),
      R => io_reset,
      S => '0'
    );
\pins[7].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(7),
      O => data_in_from_pins_int(7)
    );
\pins[7].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_in,
      CE => '1',
      D => data_in_from_pins_int(7),
      Q1 => data_in_to_device(7),
      Q2 => data_in_to_device(19),
      R => io_reset,
      S => '0'
    );
\pins[8].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(8),
      O => data_in_from_pins_int(8)
    );
\pins[8].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_in,
      CE => '1',
      D => data_in_from_pins_int(8),
      Q1 => data_in_to_device(8),
      Q2 => data_in_to_device(20),
      R => io_reset,
      S => '0'
    );
\pins[9].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(9),
      O => data_in_from_pins_int(9)
    );
\pins[9].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => clk_in,
      CE => '1',
      D => data_in_from_pins_int(9),
      Q1 => data_in_to_device(9),
      Q2 => data_in_to_device(21),
      R => io_reset,
      S => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity selectio_wiz_0 is
  port (
    data_in_from_pins : in STD_LOGIC_VECTOR ( 11 downto 0 );
    data_in_to_device : out STD_LOGIC_VECTOR ( 23 downto 0 );
    clk_in : in STD_LOGIC;
    io_reset : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of selectio_wiz_0 : entity is true;
  attribute DEV_W : integer;
  attribute DEV_W of selectio_wiz_0 : entity is 24;
  attribute SYS_W : integer;
  attribute SYS_W of selectio_wiz_0 : entity is 12;
end selectio_wiz_0;

architecture STRUCTURE of selectio_wiz_0 is
  attribute DEV_W of inst : label is 24;
  attribute SYS_W of inst : label is 12;
begin
inst: entity work.selectio_wiz_0_selectio_wiz
     port map (
      clk_in => clk_in,
      data_in_from_pins(11 downto 0) => data_in_from_pins(11 downto 0),
      data_in_to_device(23 downto 0) => data_in_to_device(23 downto 0),
      io_reset => io_reset
    );
end STRUCTURE;
