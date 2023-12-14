`default_nettype wire
module decoder #(
  parameter BAUD_RATE = 9600 
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif
  // Wishbone Slave ports (WB MI A)
  input wire    wb_clk_i,
  input wire    wb_rst_i,
  input wire    wbs_stb_i,
  input wire    wbs_cyc_i,
  input wire    wbs_we_i,
  input wire    [3:0] wbs_sel_i,
  input wire    [31:0] wbs_dat_i,
  input wire    [31:0] wbs_adr_i,
  output wire   wbs_ack_o,
  output wire   [31:0] wbs_dat_o,

  // IO ports
  input  [`MPRJ_IO_PADS-1:0] io_in,
  output [`MPRJ_IO_PADS-1:0] io_out,
  output [`MPRJ_IO_PADS-1:0] io_oeb,

  // irq
  output [2:0] user_irq,
  
  //---------------------
  // for mm/qs/fir
  //---------------------
  // Wishbone Slave ports (WB MI A)
  output wire    wb_clk_o_fir,
  output wire    wb_rst_o_fir,
  output wire    wbs_stb_o_fir,
  output wire    wbs_cyc_o_fir,
  output wire    wbs_we_o_fir,
  output wire    [3:0] wbs_sel_o_fir,
  output wire    [31:0] wbs_dat_o_fir,
  output wire    [31:0] wbs_adr_o_fir,
  input wire     wbs_ack_i_fir,
  input wire     [31:0] wbs_dat_i_fir,

  // IO ports
  output  [`MPRJ_IO_PADS-1:0] io_in_fir,
  input   [`MPRJ_IO_PADS-1:0] io_out_fir,
  input   [`MPRJ_IO_PADS-1:0] io_oeb_fir,

  // irq
  input [2:0] user_irq_fir,
  
  //---------------------
  // for uart
  //---------------------
  // Wishbone Slave ports (WB MI A)
  output wire    wb_clk_o_uart,
  output wire    wb_rst_o_uart,
  output wire    wbs_stb_o_uart,
  output wire    wbs_cyc_o_uart,
  output wire    wbs_we_o_uart,
  output wire    [3:0] wbs_sel_o_uart,
  output wire    [31:0] wbs_dat_o_uart,
  output wire    [31:0] wbs_adr_o_uart,
  input wire     wbs_ack_i_uart,
  input wire     [31:0] wbs_dat_i_uart,

  // IO ports
  output  [`MPRJ_IO_PADS-1:0] io_in_uart,
  input   [`MPRJ_IO_PADS-1:0] io_out_uart,
  input   [`MPRJ_IO_PADS-1:0] io_oeb_uart,

  // irq
  input [2:0] user_irq_uart
);

  wire fir_en;
  wire uart_en;
  
  assign fir_en = (wbs_adr_i[31:24] == 8'h38);
  //assign uart_en = (wbs_adr_i[31:24] == 8'h30);
  
  assign wbs_ack_o = fir_en ? wbs_ack_i_fir : wbs_ack_i_uart;
  assign wbs_dat_o = fir_en ? wbs_dat_i_fir : wbs_dat_i_uart;
  assign io_out    = io_out_uart;
  assign io_oeb    = io_oeb_uart ;
  assign user_irq  = user_irq_uart;
  /*
  assign io_out    = fir_en ? io_out_fir    : io_out_uart;
  assign io_oeb    = fir_en ? io_oeb_fir    : io_oeb_uart ;
  assign user_irq  = fir_en ? user_irq_fir  : user_irq_uart;
  
  assign wbs_ack_o = uart_en ? wbs_ack_i_uart : wbs_ack_i_fir;
  assign wbs_dat_o = uart_en ? wbs_dat_i_uart : wbs_dat_i_fir;
  assign io_out    = uart_en ? io_out_uart : io_out_fir;
  assign io_oeb    = uart_en ? io_oeb_uart : io_oeb_fir;
  assign user_irq  = uart_en ? user_irq_uart : user_irq_fir;
  */
  //assign io_out[6] = uart_en ? io_out_uart[6] : 1'b1;
  
  /*
  //=====FIR======
  assign wb_clk_o_fir = wb_clk_i;
  assign wb_rst_o_fir = wb_rst_i;
  assign wbs_stb_o_fir = fir_en ? wbs_stb_i : 0;
  assign wbs_cyc_o_fir = fir_en ? wbs_cyc_i : 0;
  assign wbs_we_o_fir = fir_en ? wbs_we_i : 0;
  assign wbs_sel_o_fir = fir_en ? wbs_sel_i : 0;
  assign wbs_dat_o_fir = fir_en ? wbs_dat_i : 0;
  assign wbs_adr_o_fir = fir_en ? wbs_adr_i : 0;
  assign io_in_fir = fir_en ? io_in : 40'h3FFFFFFFFE;
  
  //=====Uart======
  assign wb_clk_o_uart = wb_clk_i;
  assign wb_rst_o_uart = wb_rst_i;
  assign wbs_stb_o_uart = uart_en ? wbs_stb_i : 0;
  assign wbs_cyc_o_uart = uart_en ? wbs_cyc_i : 0;
  assign wbs_we_o_uart = uart_en ? wbs_we_i : 0;
  assign wbs_sel_o_uart = uart_en ? wbs_sel_i : 0;
  assign wbs_dat_o_uart = uart_en ? wbs_dat_i : 0;
  assign wbs_adr_o_uart = uart_en ? wbs_adr_i : 0;
  assign io_in_uart = uart_en ? io_in : 40'h3FFFFFFFFE;
  */
  
  //=====FIR======
  assign wb_clk_o_fir = wb_clk_i;
  assign wb_rst_o_fir = wb_rst_i;
  assign wbs_stb_o_fir = wbs_stb_i;
  assign wbs_cyc_o_fir = wbs_cyc_i;
  assign wbs_we_o_fir = wbs_we_i;
  assign wbs_sel_o_fir = wbs_sel_i;
  assign wbs_dat_o_fir = wbs_dat_i;
  assign wbs_adr_o_fir = wbs_adr_i;
  assign io_in_fir = io_in;
  
  //=====Uart======
  assign wb_clk_o_uart = wb_clk_i;
  assign wb_rst_o_uart = wb_rst_i;
  assign wbs_stb_o_uart = wbs_stb_i;
  assign wbs_cyc_o_uart = wbs_cyc_i;
  assign wbs_we_o_uart = wbs_we_i;
  assign wbs_sel_o_uart = wbs_sel_i;
  assign wbs_dat_o_uart = wbs_dat_i;
  assign wbs_adr_o_uart = wbs_adr_i;
  assign io_in_uart = io_in;


endmodule
