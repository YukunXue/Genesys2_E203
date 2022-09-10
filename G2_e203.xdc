##//***  GPIOA_0 GPIOA_1 GPIOA_2 GPIOA_3 GPIOA14 GPIOA15 GPIOA16 GPIOA17***//

# Clock Signal
set_property -dict { PACKAGE_PIN AD11  IOSTANDARD LVDS     } [get_ports { clk_1n }]; #IO_L12N_T1_MRCC_33 Sch=sysclk_n
set_property -dict { PACKAGE_PIN AD12  IOSTANDARD LVDS     } [get_ports { clk_1p }]; #IO_L12P_T1_MRCC_33 Sch=sysclk_p
create_clock -add -name sys_clk_pin -period 20.00 -waveform {0 10} [get_ports clk_1n]
create_clock -add -name sys_clk_pin -period 20.00 -waveform {0 10} [get_ports clk_1p]
## Buttons
set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS12 } [get_ports { gpioA_button[0] }]; #IO_25_17 Sch=btnc
set_property -dict { PACKAGE_PIN M19   IOSTANDARD LVCMOS12 } [get_ports { gpioA_button[1] }]; #IO_0_15 Sch=btnd
set_property -dict { PACKAGE_PIN M20   IOSTANDARD LVCMOS12 } [get_ports { gpioA_button[2] }]; #IO_L6P_T0_15 Sch=btnl
#set_property -dict { PACKAGE_PIN C19   IOSTANDARD LVCMOS12 } [get_ports { btnr }]; #IO_L24P_T3_17 Sch=btnr
#set_property -dict { PACKAGE_PIN B19   IOSTANDARD LVCMOS12 } [get_ports { btnu }]; #IO_L24N_T3_17 Sch=btnu
set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS33 } [get_ports { mcu_rst }]; #IO_0_14 Sch=cpu_resetn

## LEDs
set_property -dict { PACKAGE_PIN T28   IOSTANDARD LVCMOS33 } [get_ports { gpioA_LED[0] }]; #IO_L11N_T1_SRCC_14 Sch=led[0]
set_property -dict { PACKAGE_PIN V19   IOSTANDARD LVCMOS33 } [get_ports { gpioA_LED[1] }]; #IO_L19P_T3_A10_D26_14 Sch=led[1]
set_property -dict { PACKAGE_PIN U30   IOSTANDARD LVCMOS33 } [get_ports { gpioA_LED[2] }]; #IO_L15N_T2_DQS_DOUT_CSO_B_14 Sch=led[2]
set_property -dict { PACKAGE_PIN U29   IOSTANDARD LVCMOS33 } [get_ports { gpioA_LED[3] }]; #IO_L15P_T2_DQS_RDWR_B_14 Sch=led[3]


#=================  Debug   JTAG =============
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets IOBUF_jtag_TCK/O]
set_property KEEPER true [get_ports mcu_TMS]
set_property -dict { PACKAGE_PIN V30   IOSTANDARD LVCMOS33 } [get_ports { gpioA_14 }]; #IO_L17N_T2_A13_D29_14 Sch=jb_n[1] 2
set_property -dict { PACKAGE_PIN V29   IOSTANDARD LVCMOS33 } [get_ports { gpioA_15 }]; #IO_L17P_T2_A14_D30_14 Sch=jb_p[1] 1
set_property -dict { PACKAGE_PIN W26   IOSTANDARD LVCMOS33 } [get_ports { uart_rx }]; #IO_L18N_T2_A11_D27_14 Sch=jb_n[2] 4
set_property -dict { PACKAGE_PIN V25   IOSTANDARD LVCMOS33 } [get_ports { uart_tx }]; #IO_L18P_T2_A12_D28_14 Sch=jb_p[2] 3
set_property -dict { PACKAGE_PIN U25   IOSTANDARD LVCMOS33 } [get_ports { mcu_TCK }]; #IO_L14N_T2_SRCC_14 Sch=jb_n[3] 8
set_property -dict { PACKAGE_PIN T25   IOSTANDARD LVCMOS33 } [get_ports { mcu_TDO }]; #IO_L14P_T2_SRCC_14 Sch=jb_p[3] 7
set_property -dict { PACKAGE_PIN U23   IOSTANDARD LVCMOS33 } [get_ports { mcu_TMS }]; #IO_L21N_T3_DQS_A06_D22_14 Sch=jb_n[4] 10
set_property -dict { PACKAGE_PIN U22   IOSTANDARD LVCMOS33 } [get_ports { mcu_TDI }]; #IO_L21P_T3_DQS_14 Sch=jb_p[4] 9

#set_property -dict { PACKAGE_PIN V20   IOSTANDARD LVCMOS33 } [get_ports { led[4] }]; #IO_L19N_T3_A09_D25_VREF_14 Sch=led[4]
#set_property -dict { PACKAGE_PIN V26   IOSTANDARD LVCMOS33 } [get_ports { led[5] }]; #IO_L16P_T2_CSI_B_14 Sch=led[5]
#set_property -dict { PACKAGE_PIN W24   IOSTANDARD LVCMOS33 } [get_ports { led[6] }]; #IO_L20N_T3_A07_D23_14 Sch=led[6]
#set_property -dict { PACKAGE_PIN W23   IOSTANDARD LVCMOS33 } [get_ports { led[7] }]; #IO_L20P_T3_A08_D24_14 Sch=led[7]
