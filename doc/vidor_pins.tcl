# Digitale Pins =====================================================
set_location_assignment PIN_G1 -to d0 #d0
set_location_assignment PIN_N3 -to d1 #d1
set_location_assignment PIN_P3 -to d2 #d2 - PWM
set_location_assignment PIN_R3 -to d3 #d3 - PWM
set_location_assignment PIN_T3 -to d4 #d4 - PWM
set_location_assignment PIN_T2 -to d5 #d5 - PWM
set_location_assignment PIN_G16 -to d6 #d6
set_location_assignment PIN_G15 -to d7 #d7
set_location_assignment PIN_F16 -to d8 #d8 - MOSI
set_location_assignment PIN_F15 -to d9 #d9 - SCK
set_location_assignment PIN_C16 -to d10 #d10 - MISO
set_location_assignment PIN_C15 -to d11 #d11 - SDA
set_location_assignment PIN_B16 -to d12 #d12 - SCL
set_location_assignment PIN_C11 -to d13 #d13 - RX
set_location_assignment PIN_A13 -to d14 #d14 - TX

# Analoge Pins ======================================================
set_location_assignment PIN_C2 -to a0 #a0 - DAC
set_location_assignment PIN_C3 -to a1 #a1
set_location_assignment PIN_C6 -to a2 #a2
set_location_assignment PIN_D1 -to a3 #a3
set_location_assignment PIN_D3 -to a4 #a4
set_location_assignment PIN_F3 -to a5 #a5
set_location_assignment PIN_G2 -to a6 #a6

# FPGA Clock ========================================================
set_location_assignment PIN_E2 -to gclk #gclk

# PCI Express Pins ==================================================
set_location_assignment PIN_R10 -to pci_1
# 2 - 3.3V
set_location_assignment PIN_P11 -to pci_3
# 4 - Gnd
set_location_assignment PIN_R11 -to pci_5
set_location_assignment PIN_P8 -to pci_6
set_location_assignment PIN_M6 -to pci_7
set_location_assignment PIN_L7 -to pci_8
# 9 - Gnd
set_location_assignment PIN_N8 -to pci_10
set_location_assignment PIN_T8 -to pci_11
set_location_assignment PIN_M8 -to pci_12
set_location_assignment PIN_R8 -to pci_13
set_location_assignment PIN_L8 -to pci_14
# 15 - Gnd
set_location_assignment PIN_M10 -to pci_16
# 17 - NINA_MDIO
# 18 - Gnd
# 19 - NINA_MDCLK
set_location_assignment PIN_N12 -to pci_20
# 21 - Gnd
# 22 - 3.3V + RES
set_location_assignment PIN_T9 -to pci_23
# 24 - 3.3V
set_location_assignment PIN_R9 -to pci_25
# 26 - Gnd
# 27 - Gnd
set_location_assignment PIN_T13 -to pci_28
# 29 - Gnd
# 30 - 3.3V + RES
set_location_assignment PIN_A9 -to pci_31
# 32 - 3.3V + RES
set_location_assignment PIN_B9 -to pci_33
# 34 - Gnd
# 35 - Gnd
# 36 - USB_DM
# 37 - Gnd
# 38 - USB_DP
# 39 - 3.3V
# 40 - Gnd
# 41 - 3.3V
set_location_assignment PIN_R13 -to pci_42
# 43 - Gnd
set_location_assignment PIN_P14 -to pci_44
set_location_assignment PIN_T15 -to pci_45
set_location_assignment PIN_R14 -to pci_46
set_location_assignment PIN_T14 -to pci_47
set_location_assignment PIN_F14 -to pci_48
set_location_assignment PIN_D16 -to pci_49
# 50 - Gnd
set_location_assignment PIN_D15 -to pci_51
# 52 - 3.3V

# HDMI Pins =========================================================
set_location_assignment PIN_M16 -to panel_hpd #1
# 2 - Gnd
set_location_assignment PIN_R16 -to panel_tx2p #3
# 4 - Gnd
set_location_assignment PIN_P16 -to panel_tx2n #5
set_location_assignment PIN_K15 -to panel_tx1p #6
# 7 - Gnd
set_location_assignment PIN_K16 -to panel_tx1n #8
set_location_assignment PIN_J15 -to panel_tx0p #9
# 10 - Gnd
set_location_assignment PIN_J16 -to panel_tx0n #11
set_location_assignment PIN_N15 -to panel_clkp #12
# 13 - Gnd
set_location_assignment PIN_N16 -to panel_clkn #14
# 15 - NC
# 16 - Gnd
# 17 - panel_scl
# 18 - panel_sda
# 19 - 5V
# 20 - Gnd
# 21 - Gnd
# 22 - Gnd
# 23 - Gnd

# MIPI Camera Pins ==================================================
# 1 - Gnd
set_location_assignment PIN_L1 -to mipi_d0n #2
set_location_assignment PIN_L2 -to mipi_d0p #3
# 4 - Gnd
set_location_assignment PIN_J1 -to mipi_d1n #5
set_location_assignment PIN_J2 -to mipi_d1p #6
# 7 - Gnd
set_location_assignment PIN_M2 -to mipi_clkp #8
set_location_assignment PIN_M1 -to mipi_clkn #9
# 10 - Gnd
set_location_assignment PIN_M7 -to mipi_gp0 #11
set_location_assignment PIN_P9 -to mipi_gp1 #12
set_location_assignment PIN_P1 -to mipi_scl #13
set_location_assignment PIN_P2 -to mipi_sda #14
# 15 - 3.3V
