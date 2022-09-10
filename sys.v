module sys
(
    input wire clk_1p,
    input wire clk_1n,
    
    input wire mcu_rst,
	
  //gpioA LED
	inout wire [ 3:0]gpioA_LED,
	
  //gpioA button
  
    inout wire [ 2:0]gpioA_button,
	//GPIOA IIC
	inout wire gpioA_14,
	inout wire gpioA_15,
	//inout wire [31:0] gpioA,//GPIOA00~GPIOA31
  
  //uart
	inout wire uart_rx,
	inout wire uart_tx,
	
    // JD (used for JTAG connection)
    inout wire mcu_TDO,//MCU_TDO-N17
    inout wire mcu_TCK,//MCU_TCK-P15 
    inout wire mcu_TDI,//MCU_TDI-T18
    inout wire mcu_TMS//MCU_TMS-P17
);
	

  wire ck_rst;
  
  
  // All wires connected to the chip top
  wire dut_clock;
  wire dut_reset;

  wire dut_io_pads_jtag_TCK_i_ival;
  wire dut_io_pads_jtag_TMS_i_ival;
  wire dut_io_pads_jtag_TMS_o_oval;
  wire dut_io_pads_jtag_TMS_o_oe;
  wire dut_io_pads_jtag_TMS_o_ie;
  wire dut_io_pads_jtag_TMS_o_pue;
  wire dut_io_pads_jtag_TMS_o_ds;
  wire dut_io_pads_jtag_TDI_i_ival;
  wire dut_io_pads_jtag_TDO_o_oval;
  wire dut_io_pads_jtag_TDO_o_oe;

  
  wire [32-1:0] gpioB;
  
  
  
  wire [32-1:0] dut_io_pads_gpioA_i_ival;
  wire [32-1:0] dut_io_pads_gpioA_o_oval;
  wire [32-1:0] dut_io_pads_gpioA_o_oe;

  wire [32-1:0] dut_io_pads_gpioB_i_ival;
  wire [32-1:0] dut_io_pads_gpioB_o_oval;
  wire [32-1:0] dut_io_pads_gpioB_o_oe;


  
  wire dut_io_pads_aon_erst_n_i_ival;
  wire dut_io_pads_aon_pmu_dwakeup_n_i_ival;
  wire dut_io_pads_aon_pmu_vddpaden_o_oval;
  wire dut_io_pads_aon_pmu_padrst_o_oval ;
  wire dut_io_pads_bootrom_n_i_ival;
  wire dut_io_pads_dbgmode0_n_i_ival;
  wire dut_io_pads_dbgmode1_n_i_ival;
  wire dut_io_pads_dbgmode2_n_i_ival;
   //=================================================
  // Clock & Reset
  wire clk200M;
  wire clk_8388;
  wire clk_16M;
  wire pll_locked;
  wire CLK32768KHZ;
  assign ck_rst =  mcu_rst;
  
	IBUFGDS #(
		.DIFF_TERM    ("FALSE"),
		.IBUF_LOW_PWR ("TRUE"),
		.IOSTANDARD   ("LVDS")
	) get_clk (
		.O  (clk200M),
		.I  (clk_1p),
		.IB (clk_1n)
	);
  
  
  
 clk_wiz_0 PLL
  (
    .CLK_O_16M(clk_16M),
    .CLK_O_8M388(clk_8388),
  // Status and control signals
    .resetn(ck_rst),
    .locked(pll_locked),
    .clk_in1(clk200M)
  );
  
    clkdivider rtc_clk_gen(
    .clk         (clk_8388   ),//generate 32.768KHz
    .reset       (~pll_locked),
    .clk_out     (CLK32768KHZ)
  );

  assign ck_rst = mcu_rst;
  
   //=================================================
  // IOBUF instantiation for GPIOs
  //***led**//
  IOBUF
  #(
    .DRIVE(12),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
  )
  gpioA_LED_USED
  (
    .O(dut_io_pads_gpioA_i_ival[0]),
    .IO(gpioA_LED[0]),
    .I(dut_io_pads_gpioA_o_oval[0]),
    .T(~dut_io_pads_gpioA_o_oe[0])
  ); 
  IOBUF
  #(
    .DRIVE(12),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
  )
  gpioA1_LED_USED
  (
    .O(dut_io_pads_gpioA_i_ival[1]),
    .IO(gpioA_LED[1]),
    .I(dut_io_pads_gpioA_o_oval[1]),
    .T(~dut_io_pads_gpioA_o_oe[1])
  ); 
    IOBUF
  #(
    .DRIVE(12),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
  )
  gpioA2_LED_USED
  (
    .O(dut_io_pads_gpioA_i_ival[2]),
    .IO(gpioA_LED[2]),
    .I(dut_io_pads_gpioA_o_oval[2]),
    .T(~dut_io_pads_gpioA_o_oe[2])
  ); 
    IOBUF
  #(
    .DRIVE(12),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
  )
  gpioA3_LED_USED
  (
    .O(dut_io_pads_gpioA_i_ival[3]),
    .IO(gpioA_LED[3]),
    .I(dut_io_pads_gpioA_o_oval[3]),
    .T(~dut_io_pads_gpioA_o_oe[3])
  ); 


    //***button**//
  IOBUF
  #(
    .DRIVE(12),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
  )
  gpioA_button_USED
  (
    .O(dut_io_pads_gpioA_i_ival[6:4]),
    .IO(gpioA_button),
    .I(dut_io_pads_gpioA_o_oval[6:4]),
    .T(~dut_io_pads_gpioA_o_oe[6:4])
  ); 
  //** I2C***//
    IOBUF
  #(
    .DRIVE(12),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
  )
  gpioA_SCL
  (
    .O(dut_io_pads_gpioA_i_ival[14]),
    .IO(gpioA_14),
    .I(dut_io_pads_gpioA_o_oval[14]),
    .T(~dut_io_pads_gpioA_o_oe[14])
  ); 
  
    IOBUF
  #(
    .DRIVE(12),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
  )
  gpioA_SDA
  (
    .O(dut_io_pads_gpioA_i_ival[15]),
    .IO(gpioA_15),
    .I(dut_io_pads_gpioA_o_oval[15]),
    .T(~dut_io_pads_gpioA_o_oe[15])
  ); 
  
  //**uart**//
    IOBUF
  #(
    .DRIVE(12),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
  )
  gpioA_TX_used
  (
    .O(dut_io_pads_gpioA_i_ival[17]),
    .IO(uart_tx),
    .I(dut_io_pads_gpioA_o_oval[17]),
    .T(~dut_io_pads_gpioA_o_oe[17])
  ); 

    IOBUF
  #(
    .DRIVE(12),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
  )
  gpioA_RX_used
  (
    .O(dut_io_pads_gpioA_i_ival[16]),
    .IO(uart_rx),
    .I(dut_io_pads_gpioA_o_oval[16]),
    .T(~dut_io_pads_gpioA_o_oe[16])
  );   
  
  
  
   //=================================================
  // JTAG IOBUFs

   wire iobuf_jtag_TCK_o;
  IOBUF
  #(
    .DRIVE(12),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
  )
  IOBUF_jtag_TCK
  (
    .O(iobuf_jtag_TCK_o),
    .IO(mcu_TCK),
    .I(1'b0),
    .T(1'b1) //output
  );
  assign dut_io_pads_jtag_TCK_i_ival = iobuf_jtag_TCK_o ;
  PULLUP pullup_TCK 
  (
    .O(mcu_TCK)
  );

  wire iobuf_jtag_TMS_o;
  IOBUF
  #(
    .DRIVE(12),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
  )
  IOBUF_jtag_TMS
  (
    .O(iobuf_jtag_TMS_o),
    .IO(mcu_TMS),
    .I(1'b0),
    .T(1'b1) //output
  );
  assign dut_io_pads_jtag_TMS_i_ival = iobuf_jtag_TMS_o;
  PULLUP pullup_TMS 
  (
    .O(mcu_TMS)
  );


  IOBUF
  #(
    .DRIVE(12),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
  )
  IOBUF_jtag_TDI
  (
    .O(dut_io_pads_jtag_TDI_i_ival),
    .IO(mcu_TDI),
    .I(1'b0),
    .T(1'b1)
  );

  PULLUP pullup_TDI 
  (
    .O(mcu_TDI)
  );

  wire iobuf_jtag_TDO_o;
  IOBUF
  #(
    .DRIVE(12),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
  )
  IOBUF_jtag_TDO
  (
    .O(iobuf_jtag_TDO_o),
    .IO(mcu_TDO),
    .I(dut_io_pads_jtag_TDO_o_oval),
    .T(~dut_io_pads_jtag_TDO_o_oe)
  );

    // model select
  assign dut_io_pads_bootrom_n_i_ival  = 1'b0;   //
  assign dut_io_pads_dbgmode0_n_i_ival = 1'b1;
  assign dut_io_pads_dbgmode1_n_i_ival = 1'b1;
  assign dut_io_pads_dbgmode2_n_i_ival = 1'b1;
  //

 e203_soc_top dut
  (
    //System CLOCK
    .hfextclk(clk_16M),
    .hfxoscen(1'b1),

    //RTC CLOCK
    .lfextclk(CLK32768KHZ), 
    .lfxoscen(1'b1),

    //JTAG
    .io_pads_jtag_TCK_i_ival(dut_io_pads_jtag_TCK_i_ival),
    .io_pads_jtag_TMS_i_ival(dut_io_pads_jtag_TMS_i_ival),
    .io_pads_jtag_TDI_i_ival(dut_io_pads_jtag_TDI_i_ival),
    .io_pads_jtag_TDO_o_oval(dut_io_pads_jtag_TDO_o_oval),
    .io_pads_jtag_TDO_o_oe  (dut_io_pads_jtag_TDO_o_oe),

    //GPIO A
    .io_pads_gpioA_i_ival(dut_io_pads_gpioA_i_ival),
    .io_pads_gpioA_o_oval(dut_io_pads_gpioA_o_oval),
    .io_pads_gpioA_o_oe  (dut_io_pads_gpioA_o_oe),
    //GPIO B
    .io_pads_gpioB_i_ival(dut_io_pads_gpioB_i_ival),
    .io_pads_gpioB_o_oval(dut_io_pads_gpioB_o_oval),
    .io_pads_gpioB_o_oe  (dut_io_pads_gpioB_o_oe),

    //QPSI
    .io_pads_qspi0_sck_o_oval (),
    .io_pads_qspi0_cs_0_o_oval(),
    .io_pads_qspi0_dq_0_i_ival(),
    .io_pads_qspi0_dq_0_o_oval(),
    .io_pads_qspi0_dq_0_o_oe  (),
    .io_pads_qspi0_dq_1_i_ival(),
    .io_pads_qspi0_dq_1_o_oval(),
    .io_pads_qspi0_dq_1_o_oe  (),
    .io_pads_qspi0_dq_2_i_ival(),
    .io_pads_qspi0_dq_2_o_oval(),
    .io_pads_qspi0_dq_2_o_oe  (),
    .io_pads_qspi0_dq_3_i_ival(),
    .io_pads_qspi0_dq_3_o_oval(),
    .io_pads_qspi0_dq_3_o_oe  (),
    /*
    //QPSI
    .io_pads_qspi0_sck_o_oval (dut_io_pads_qspi0_sck_o_oval),
    .io_pads_qspi0_cs_0_o_oval(dut_io_pads_qspi0_cs_0_o_oval),

    .io_pads_qspi0_dq_0_i_ival(dut_io_pads_qspi0_dq_0_i_ival),
    .io_pads_qspi0_dq_0_o_oval(dut_io_pads_qspi0_dq_0_o_oval),
    .io_pads_qspi0_dq_0_o_oe  (dut_io_pads_qspi0_dq_0_o_oe),
    .io_pads_qspi0_dq_1_i_ival(dut_io_pads_qspi0_dq_1_i_ival),
    .io_pads_qspi0_dq_1_o_oval(dut_io_pads_qspi0_dq_1_o_oval),
    .io_pads_qspi0_dq_1_o_oe  (dut_io_pads_qspi0_dq_1_o_oe),
    .io_pads_qspi0_dq_2_i_ival(dut_io_pads_qspi0_dq_2_i_ival),
    .io_pads_qspi0_dq_2_o_oval(dut_io_pads_qspi0_dq_2_o_oval),
    .io_pads_qspi0_dq_2_o_oe  (dut_io_pads_qspi0_dq_2_o_oe),
    .io_pads_qspi0_dq_3_i_ival(dut_io_pads_qspi0_dq_3_i_ival),
    .io_pads_qspi0_dq_3_o_oval(dut_io_pads_qspi0_dq_3_o_oval),
    .io_pads_qspi0_dq_3_o_oe  (dut_io_pads_qspi0_dq_3_o_oe),
    */
    //RST_N
    .io_pads_aon_erst_n_i_ival(ck_rst),

//    //PMU
    .io_pads_aon_pmu_dwakeup_n_i_ival(),
    .io_pads_aon_pmu_vddpaden_o_oval (),
    .io_pads_aon_pmu_padrst_o_oval   (),

    //PMU
//    .io_pads_aon_pmu_dwakeup_n_i_ival(dut_io_pads_aon_pmu_dwakeup_n_i_ival),
//    .io_pads_aon_pmu_vddpaden_o_oval(dut_io_pads_aon_pmu_vddpaden_o_oval),
//    .io_pads_aon_pmu_padrst_o_oval    (dut_io_pads_aon_pmu_padrst_o_oval ),
    


    .io_pads_bootrom_n_i_ival        (dut_io_pads_bootrom_n_i_ival),

    .io_pads_dbgmode0_n_i_ival       (dut_io_pads_dbgmode0_n_i_ival),
    .io_pads_dbgmode1_n_i_ival       (dut_io_pads_dbgmode1_n_i_ival),
    .io_pads_dbgmode2_n_i_ival       (dut_io_pads_dbgmode2_n_i_ival) 
    
  );
 

  
 endmodule