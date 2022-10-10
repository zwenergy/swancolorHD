# swancolorHD
An open-source WonderSwan Color consolizer.

This project is in a very early stage right now.
Additionally, it needs the video core from sameer, to be [found here](https://github.com/hdl-util/hdmi).

## About
This project is an open-source consolizer for the WonderSwan Color handheld, based on a Tang Nano 9k FPGA board (which has a GW1NR-LV9QN88P FPGA on it).

## PCB BOM
| **Reference** | **Part** | **Link** |
---------|------|------|
|FPC1    | FFC connector with 24 pins, 0.5mm pitch, bottom contacts | [LCSC](https://lcsc.com/product-detail/FFC-FPC-Connectors_XUNPU-FPC-05F-24PH20_C2856805.html)|
|U1      | Arduino Nano | [AliExpress](https://aliexpress.com/item/1005002966043359.html)|
|U2      | Tang Nano 9k | [AliExpress](https://aliexpress.com/item/1005004275570427.html)|
|U3      | TPS62221DDCR | [LCSC](https://lcsc.com/product-detail/DC-DC-Converters_Texas-Instruments-TPS62221DDCR_C398348.html)|
|USB1    | Micro USB connector | [LCSC](https://lcsc.com/product-detail/USB-Connectors_XKB-Connectivity-U254-051T-4BH23-S2S_C482361.html)|
|JOY1    | SNES controller connector 90° | [AliExpress](https://aliexpress.com/item/32895254743.html)|
|C1      | 4.7 uF capacitor (1206) | [LCSC](https://lcsc.com/product-detail/Multilayer-Ceramic-Capacitors-MLCC-SMD-SMT_FH-Guangdong-Fenghua-Advanced-Tech-1206B475K500NT_C29823.html)|
|C2 | 10 uF capacitor (1206) | [LCSC](https://lcsc.com/product-detail/Multilayer-Ceramic-Capacitors-MLCC-SMD-SMT_Samsung-Electro-Mechanics-CL31A106KBHNNNE_C13585.html)|
|L2 | 10 uH inductivity (1206) | [LCSC](https://lcsc.com/product-detail/Inductors-SMD_FH-Guangdong-Fenghua-Advanced-Tech-CMI321609X100KT_C1051.html)|
|Q1 - Q12 | N-channel MOSFET 2N7002 (SOT-23) |[LCSC](https://lcsc.com/product-detail/MOSFETs_Jiangsu-Changjing-Electronics-Technology-Co-Ltd-2N7002_C8545.html)|

## Manual Wiring (without PCB)
The display signals can be easily wired to the FPGA board by using an FFC breakout board and an FFC cable.
The required FFC is 24 pins with 0.5 mm pitch.

| WSC display pin | Tang Nano 9k pin |
|-----------------|------------------|
| 19              | GND              |
| 22              | 86               |
| 21              | 85               |
| 23              | 84               |
| 18              | 83               |
| 14              | 82               |
| 15              | 81               |
| 16              | 80               |
| 17              | 79               |
| 10              | 25               |
| 11              | 26               |
| 12              | 27               |
| 13              | 28               |
| 6               | 29               |
| 7               | 30               |
| 8               | 33               |
| 9               | 34               |
