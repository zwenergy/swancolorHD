# swancolorHD
An open-source WonderSwan Color consolizer.

This project is in a very early stage right now, just video, no audio yet.
Additionally, it needs the video core from sameer, to be [found here](https://github.com/hdl-util/hdmi).

## About
This project is an open-source consolizer for the WonderSwan Color handheld, based on a Tang Nano 9k board.

# Wiring
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
