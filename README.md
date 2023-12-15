# SoC Lab6 Group 10

## Introduction
There are four workloads in this lab: matrix multiplication, quick sort, fir and uart. We get familiar with the uart behavior and observe the interruption in CPU.

In Lab6, we integrate the four workloads by modify the firmware code and the testbench. We also add a decoder in user project hardware to separate the user project and the uart request. After integrated the workloads, we synthesis and implement the design and use jupyter notebook to verify the results.

## File arrangement
### Design sources
* **Tesebench**: testbench/uart/uart_tb.v https://github.com/chloewangmeow/SoC_Lab6/blob/main/testbench/uart/uart_tb.v
* **Firmware code**: testbench/uart/counter_la_uart.c https://github.com/chloewangmeow/SoC_Lab6/blob/main/testbench/uart/counter_la_uart.c
* **Other .c and .h files** in `testbench/uart`
  * matmul.c, matmul.h
  * qsort.c, qsort.h
  * fir.c, fir.h
  * uart.c

### User project design
* **Decoder**: rtl/user/decoder.v https://github.com/chloewangmeow/SoC_Lab6/blob/main/rtl/user/decoder.v

### FPGA required files
* **.ipynb file**:vivado/jupyter_notebook/caravel_fpga_uart.ipynb https://github.com/chloewangmeow/SoC_Lab6/blob/main/vivado/jupyter_notebook/caravel_fpga_uart.ipynb
* **uartlite.py**: vivado/jupyter_notebook/uartlite.py https://github.com/chloewangmeow/SoC_Lab6/blob/main/vivado/jupyter_notebook/uartlite.py
* **.bit file**: vivado/jupyter_notebook/caravel_fpga.bit https://github.com/chloewangmeow/SoC_Lab6/blob/main/vivado/jupyter_notebook/caravel_fpga.bit
* **.hwh file**: vivado/jupyter_notebook/caravel_fpga.hwh https://github.com/chloewangmeow/SoC_Lab6/blob/main/vivado/jupyter_notebook/caravel_fpga.hwh
* **.hex file**: testbench/uart/uart.hex https://github.com/chloewangmeow/SoC_Lab6/blob/main/testbench/uart/uart.hex

### Reports
* **Report**: report.pdf https://github.com/chloewangmeow/SoC_Lab6/blob/main/report.pdf
* **Implementation area report**: vivado/vvd_caravel_fpga/vvd_caravel_fpga.runs/impl_1/design_1_wrapper_utilization_placed.rpt https://github.com/chloewangmeow/SoC_Lab6/blob/main/vivado/vvd_caravel_fpga/vvd_caravel_fpga.runs/impl_1/design_1_wrapper_utilization_placed.rpt
* **Timing report**: vivado/timing_report.log https://github.com/chloewangmeow/SoC_Lab6/blob/main/vivado/timing_report.log

## Simulation and Verification
### Simulation for the four workloads (mm/qs/fir/uart)
```sh
cd testbench/uart
source run_clean
source run_sim
```
### Vivado Synthesis and Generate bitstream
```sh
cd vivado
source run_vivado
```


