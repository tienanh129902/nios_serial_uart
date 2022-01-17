// serial_uart.v

// Generated using ACDS version 17.1 590

`timescale 1 ps / 1 ps
module serial_uart (
		input  wire       clk_clk,                        //                      clk.clk
		output wire [7:0] led_external_connection_export, //  led_external_connection.export
		input  wire       uart_external_connection_rxd,   // uart_external_connection.rxd
		output wire       uart_external_connection_txd    //                         .txd
	);

	wire         nios2_gen2_0_debug_reset_request_reset;                     // nios2_gen2_0:debug_reset_request -> [rst_controller:reset_in0, rst_controller:reset_in1]
	wire  [31:0] nios2_gen2_0_data_master_readdata;                          // mm_interconnect_0:nios2_gen2_0_data_master_readdata -> nios2_gen2_0:d_readdata
	wire         nios2_gen2_0_data_master_waitrequest;                       // mm_interconnect_0:nios2_gen2_0_data_master_waitrequest -> nios2_gen2_0:d_waitrequest
	wire         nios2_gen2_0_data_master_debugaccess;                       // nios2_gen2_0:debug_mem_slave_debugaccess_to_roms -> mm_interconnect_0:nios2_gen2_0_data_master_debugaccess
	wire  [14:0] nios2_gen2_0_data_master_address;                           // nios2_gen2_0:d_address -> mm_interconnect_0:nios2_gen2_0_data_master_address
	wire   [3:0] nios2_gen2_0_data_master_byteenable;                        // nios2_gen2_0:d_byteenable -> mm_interconnect_0:nios2_gen2_0_data_master_byteenable
	wire         nios2_gen2_0_data_master_read;                              // nios2_gen2_0:d_read -> mm_interconnect_0:nios2_gen2_0_data_master_read
	wire         nios2_gen2_0_data_master_readdatavalid;                     // mm_interconnect_0:nios2_gen2_0_data_master_readdatavalid -> nios2_gen2_0:d_readdatavalid
	wire         nios2_gen2_0_data_master_write;                             // nios2_gen2_0:d_write -> mm_interconnect_0:nios2_gen2_0_data_master_write
	wire  [31:0] nios2_gen2_0_data_master_writedata;                         // nios2_gen2_0:d_writedata -> mm_interconnect_0:nios2_gen2_0_data_master_writedata
	wire  [31:0] nios2_gen2_0_instruction_master_readdata;                   // mm_interconnect_0:nios2_gen2_0_instruction_master_readdata -> nios2_gen2_0:i_readdata
	wire         nios2_gen2_0_instruction_master_waitrequest;                // mm_interconnect_0:nios2_gen2_0_instruction_master_waitrequest -> nios2_gen2_0:i_waitrequest
	wire  [14:0] nios2_gen2_0_instruction_master_address;                    // nios2_gen2_0:i_address -> mm_interconnect_0:nios2_gen2_0_instruction_master_address
	wire         nios2_gen2_0_instruction_master_read;                       // nios2_gen2_0:i_read -> mm_interconnect_0:nios2_gen2_0_instruction_master_read
	wire         nios2_gen2_0_instruction_master_readdatavalid;              // mm_interconnect_0:nios2_gen2_0_instruction_master_readdatavalid -> nios2_gen2_0:i_readdatavalid
	wire  [31:0] mm_interconnect_0_nios2_gen2_0_debug_mem_slave_readdata;    // nios2_gen2_0:debug_mem_slave_readdata -> mm_interconnect_0:nios2_gen2_0_debug_mem_slave_readdata
	wire         mm_interconnect_0_nios2_gen2_0_debug_mem_slave_waitrequest; // nios2_gen2_0:debug_mem_slave_waitrequest -> mm_interconnect_0:nios2_gen2_0_debug_mem_slave_waitrequest
	wire         mm_interconnect_0_nios2_gen2_0_debug_mem_slave_debugaccess; // mm_interconnect_0:nios2_gen2_0_debug_mem_slave_debugaccess -> nios2_gen2_0:debug_mem_slave_debugaccess
	wire   [8:0] mm_interconnect_0_nios2_gen2_0_debug_mem_slave_address;     // mm_interconnect_0:nios2_gen2_0_debug_mem_slave_address -> nios2_gen2_0:debug_mem_slave_address
	wire         mm_interconnect_0_nios2_gen2_0_debug_mem_slave_read;        // mm_interconnect_0:nios2_gen2_0_debug_mem_slave_read -> nios2_gen2_0:debug_mem_slave_read
	wire   [3:0] mm_interconnect_0_nios2_gen2_0_debug_mem_slave_byteenable;  // mm_interconnect_0:nios2_gen2_0_debug_mem_slave_byteenable -> nios2_gen2_0:debug_mem_slave_byteenable
	wire         mm_interconnect_0_nios2_gen2_0_debug_mem_slave_write;       // mm_interconnect_0:nios2_gen2_0_debug_mem_slave_write -> nios2_gen2_0:debug_mem_slave_write
	wire  [31:0] mm_interconnect_0_nios2_gen2_0_debug_mem_slave_writedata;   // mm_interconnect_0:nios2_gen2_0_debug_mem_slave_writedata -> nios2_gen2_0:debug_mem_slave_writedata
	wire         mm_interconnect_0_onchip_memory2_0_s1_chipselect;           // mm_interconnect_0:onchip_memory2_0_s1_chipselect -> onchip_memory2_0:chipselect
	wire  [31:0] mm_interconnect_0_onchip_memory2_0_s1_readdata;             // onchip_memory2_0:readdata -> mm_interconnect_0:onchip_memory2_0_s1_readdata
	wire  [10:0] mm_interconnect_0_onchip_memory2_0_s1_address;              // mm_interconnect_0:onchip_memory2_0_s1_address -> onchip_memory2_0:address
	wire   [3:0] mm_interconnect_0_onchip_memory2_0_s1_byteenable;           // mm_interconnect_0:onchip_memory2_0_s1_byteenable -> onchip_memory2_0:byteenable
	wire         mm_interconnect_0_onchip_memory2_0_s1_write;                // mm_interconnect_0:onchip_memory2_0_s1_write -> onchip_memory2_0:write
	wire  [31:0] mm_interconnect_0_onchip_memory2_0_s1_writedata;            // mm_interconnect_0:onchip_memory2_0_s1_writedata -> onchip_memory2_0:writedata
	wire         mm_interconnect_0_onchip_memory2_0_s1_clken;                // mm_interconnect_0:onchip_memory2_0_s1_clken -> onchip_memory2_0:clken
	wire         mm_interconnect_0_uart_s1_chipselect;                       // mm_interconnect_0:uart_s1_chipselect -> uart:chipselect
	wire  [15:0] mm_interconnect_0_uart_s1_readdata;                         // uart:readdata -> mm_interconnect_0:uart_s1_readdata
	wire   [2:0] mm_interconnect_0_uart_s1_address;                          // mm_interconnect_0:uart_s1_address -> uart:address
	wire         mm_interconnect_0_uart_s1_read;                             // mm_interconnect_0:uart_s1_read -> uart:read_n
	wire         mm_interconnect_0_uart_s1_begintransfer;                    // mm_interconnect_0:uart_s1_begintransfer -> uart:begintransfer
	wire         mm_interconnect_0_uart_s1_write;                            // mm_interconnect_0:uart_s1_write -> uart:write_n
	wire  [15:0] mm_interconnect_0_uart_s1_writedata;                        // mm_interconnect_0:uart_s1_writedata -> uart:writedata
	wire         mm_interconnect_0_led_s1_chipselect;                        // mm_interconnect_0:led_s1_chipselect -> led:chipselect
	wire  [31:0] mm_interconnect_0_led_s1_readdata;                          // led:readdata -> mm_interconnect_0:led_s1_readdata
	wire   [1:0] mm_interconnect_0_led_s1_address;                           // mm_interconnect_0:led_s1_address -> led:address
	wire         mm_interconnect_0_led_s1_write;                             // mm_interconnect_0:led_s1_write -> led:write_n
	wire  [31:0] mm_interconnect_0_led_s1_writedata;                         // mm_interconnect_0:led_s1_writedata -> led:writedata
	wire         irq_mapper_receiver0_irq;                                   // uart:irq -> irq_mapper:receiver0_irq
	wire  [31:0] nios2_gen2_0_irq_irq;                                       // irq_mapper:sender_irq -> nios2_gen2_0:irq
	wire         rst_controller_reset_out_reset;                             // rst_controller:reset_out -> [irq_mapper:reset, led:reset_n, mm_interconnect_0:nios2_gen2_0_reset_reset_bridge_in_reset_reset, nios2_gen2_0:reset_n, onchip_memory2_0:reset, rst_translator:in_reset, uart:reset_n]
	wire         rst_controller_reset_out_reset_req;                         // rst_controller:reset_req -> [nios2_gen2_0:reset_req, onchip_memory2_0:reset_req, rst_translator:reset_req_in]

	serial_uart_led led (
		.clk        (clk_clk),                             //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),     //               reset.reset_n
		.address    (mm_interconnect_0_led_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_led_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_led_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_led_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_led_s1_readdata),   //                    .readdata
		.out_port   (led_external_connection_export)       // external_connection.export
	);

	serial_uart_nios2_gen2_0 nios2_gen2_0 (
		.clk                                 (clk_clk),                                                    //                       clk.clk
		.reset_n                             (~rst_controller_reset_out_reset),                            //                     reset.reset_n
		.reset_req                           (rst_controller_reset_out_reset_req),                         //                          .reset_req
		.d_address                           (nios2_gen2_0_data_master_address),                           //               data_master.address
		.d_byteenable                        (nios2_gen2_0_data_master_byteenable),                        //                          .byteenable
		.d_read                              (nios2_gen2_0_data_master_read),                              //                          .read
		.d_readdata                          (nios2_gen2_0_data_master_readdata),                          //                          .readdata
		.d_waitrequest                       (nios2_gen2_0_data_master_waitrequest),                       //                          .waitrequest
		.d_write                             (nios2_gen2_0_data_master_write),                             //                          .write
		.d_writedata                         (nios2_gen2_0_data_master_writedata),                         //                          .writedata
		.d_readdatavalid                     (nios2_gen2_0_data_master_readdatavalid),                     //                          .readdatavalid
		.debug_mem_slave_debugaccess_to_roms (nios2_gen2_0_data_master_debugaccess),                       //                          .debugaccess
		.i_address                           (nios2_gen2_0_instruction_master_address),                    //        instruction_master.address
		.i_read                              (nios2_gen2_0_instruction_master_read),                       //                          .read
		.i_readdata                          (nios2_gen2_0_instruction_master_readdata),                   //                          .readdata
		.i_waitrequest                       (nios2_gen2_0_instruction_master_waitrequest),                //                          .waitrequest
		.i_readdatavalid                     (nios2_gen2_0_instruction_master_readdatavalid),              //                          .readdatavalid
		.irq                                 (nios2_gen2_0_irq_irq),                                       //                       irq.irq
		.debug_reset_request                 (nios2_gen2_0_debug_reset_request_reset),                     //       debug_reset_request.reset
		.debug_mem_slave_address             (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_address),     //           debug_mem_slave.address
		.debug_mem_slave_byteenable          (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_byteenable),  //                          .byteenable
		.debug_mem_slave_debugaccess         (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_debugaccess), //                          .debugaccess
		.debug_mem_slave_read                (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_read),        //                          .read
		.debug_mem_slave_readdata            (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_readdata),    //                          .readdata
		.debug_mem_slave_waitrequest         (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_waitrequest), //                          .waitrequest
		.debug_mem_slave_write               (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_write),       //                          .write
		.debug_mem_slave_writedata           (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_writedata),   //                          .writedata
		.dummy_ci_port                       ()                                                            // custom_instruction_master.readra
	);

	serial_uart_onchip_memory2_0 onchip_memory2_0 (
		.clk        (clk_clk),                                          //   clk1.clk
		.address    (mm_interconnect_0_onchip_memory2_0_s1_address),    //     s1.address
		.clken      (mm_interconnect_0_onchip_memory2_0_s1_clken),      //       .clken
		.chipselect (mm_interconnect_0_onchip_memory2_0_s1_chipselect), //       .chipselect
		.write      (mm_interconnect_0_onchip_memory2_0_s1_write),      //       .write
		.readdata   (mm_interconnect_0_onchip_memory2_0_s1_readdata),   //       .readdata
		.writedata  (mm_interconnect_0_onchip_memory2_0_s1_writedata),  //       .writedata
		.byteenable (mm_interconnect_0_onchip_memory2_0_s1_byteenable), //       .byteenable
		.reset      (rst_controller_reset_out_reset),                   // reset1.reset
		.reset_req  (rst_controller_reset_out_reset_req),               //       .reset_req
		.freeze     (1'b0)                                              // (terminated)
	);

	serial_uart_uart uart (
		.clk           (clk_clk),                                 //                 clk.clk
		.reset_n       (~rst_controller_reset_out_reset),         //               reset.reset_n
		.address       (mm_interconnect_0_uart_s1_address),       //                  s1.address
		.begintransfer (mm_interconnect_0_uart_s1_begintransfer), //                    .begintransfer
		.chipselect    (mm_interconnect_0_uart_s1_chipselect),    //                    .chipselect
		.read_n        (~mm_interconnect_0_uart_s1_read),         //                    .read_n
		.write_n       (~mm_interconnect_0_uart_s1_write),        //                    .write_n
		.writedata     (mm_interconnect_0_uart_s1_writedata),     //                    .writedata
		.readdata      (mm_interconnect_0_uart_s1_readdata),      //                    .readdata
		.rxd           (uart_external_connection_rxd),            // external_connection.export
		.txd           (uart_external_connection_txd),            //                    .export
		.irq           (irq_mapper_receiver0_irq)                 //                 irq.irq
	);

	serial_uart_mm_interconnect_0 mm_interconnect_0 (
		.clk_clk_clk                                    (clk_clk),                                                    //                                  clk_clk.clk
		.nios2_gen2_0_reset_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                             // nios2_gen2_0_reset_reset_bridge_in_reset.reset
		.nios2_gen2_0_data_master_address               (nios2_gen2_0_data_master_address),                           //                 nios2_gen2_0_data_master.address
		.nios2_gen2_0_data_master_waitrequest           (nios2_gen2_0_data_master_waitrequest),                       //                                         .waitrequest
		.nios2_gen2_0_data_master_byteenable            (nios2_gen2_0_data_master_byteenable),                        //                                         .byteenable
		.nios2_gen2_0_data_master_read                  (nios2_gen2_0_data_master_read),                              //                                         .read
		.nios2_gen2_0_data_master_readdata              (nios2_gen2_0_data_master_readdata),                          //                                         .readdata
		.nios2_gen2_0_data_master_readdatavalid         (nios2_gen2_0_data_master_readdatavalid),                     //                                         .readdatavalid
		.nios2_gen2_0_data_master_write                 (nios2_gen2_0_data_master_write),                             //                                         .write
		.nios2_gen2_0_data_master_writedata             (nios2_gen2_0_data_master_writedata),                         //                                         .writedata
		.nios2_gen2_0_data_master_debugaccess           (nios2_gen2_0_data_master_debugaccess),                       //                                         .debugaccess
		.nios2_gen2_0_instruction_master_address        (nios2_gen2_0_instruction_master_address),                    //          nios2_gen2_0_instruction_master.address
		.nios2_gen2_0_instruction_master_waitrequest    (nios2_gen2_0_instruction_master_waitrequest),                //                                         .waitrequest
		.nios2_gen2_0_instruction_master_read           (nios2_gen2_0_instruction_master_read),                       //                                         .read
		.nios2_gen2_0_instruction_master_readdata       (nios2_gen2_0_instruction_master_readdata),                   //                                         .readdata
		.nios2_gen2_0_instruction_master_readdatavalid  (nios2_gen2_0_instruction_master_readdatavalid),              //                                         .readdatavalid
		.led_s1_address                                 (mm_interconnect_0_led_s1_address),                           //                                   led_s1.address
		.led_s1_write                                   (mm_interconnect_0_led_s1_write),                             //                                         .write
		.led_s1_readdata                                (mm_interconnect_0_led_s1_readdata),                          //                                         .readdata
		.led_s1_writedata                               (mm_interconnect_0_led_s1_writedata),                         //                                         .writedata
		.led_s1_chipselect                              (mm_interconnect_0_led_s1_chipselect),                        //                                         .chipselect
		.nios2_gen2_0_debug_mem_slave_address           (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_address),     //             nios2_gen2_0_debug_mem_slave.address
		.nios2_gen2_0_debug_mem_slave_write             (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_write),       //                                         .write
		.nios2_gen2_0_debug_mem_slave_read              (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_read),        //                                         .read
		.nios2_gen2_0_debug_mem_slave_readdata          (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_readdata),    //                                         .readdata
		.nios2_gen2_0_debug_mem_slave_writedata         (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_writedata),   //                                         .writedata
		.nios2_gen2_0_debug_mem_slave_byteenable        (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_byteenable),  //                                         .byteenable
		.nios2_gen2_0_debug_mem_slave_waitrequest       (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_waitrequest), //                                         .waitrequest
		.nios2_gen2_0_debug_mem_slave_debugaccess       (mm_interconnect_0_nios2_gen2_0_debug_mem_slave_debugaccess), //                                         .debugaccess
		.onchip_memory2_0_s1_address                    (mm_interconnect_0_onchip_memory2_0_s1_address),              //                      onchip_memory2_0_s1.address
		.onchip_memory2_0_s1_write                      (mm_interconnect_0_onchip_memory2_0_s1_write),                //                                         .write
		.onchip_memory2_0_s1_readdata                   (mm_interconnect_0_onchip_memory2_0_s1_readdata),             //                                         .readdata
		.onchip_memory2_0_s1_writedata                  (mm_interconnect_0_onchip_memory2_0_s1_writedata),            //                                         .writedata
		.onchip_memory2_0_s1_byteenable                 (mm_interconnect_0_onchip_memory2_0_s1_byteenable),           //                                         .byteenable
		.onchip_memory2_0_s1_chipselect                 (mm_interconnect_0_onchip_memory2_0_s1_chipselect),           //                                         .chipselect
		.onchip_memory2_0_s1_clken                      (mm_interconnect_0_onchip_memory2_0_s1_clken),                //                                         .clken
		.uart_s1_address                                (mm_interconnect_0_uart_s1_address),                          //                                  uart_s1.address
		.uart_s1_write                                  (mm_interconnect_0_uart_s1_write),                            //                                         .write
		.uart_s1_read                                   (mm_interconnect_0_uart_s1_read),                             //                                         .read
		.uart_s1_readdata                               (mm_interconnect_0_uart_s1_readdata),                         //                                         .readdata
		.uart_s1_writedata                              (mm_interconnect_0_uart_s1_writedata),                        //                                         .writedata
		.uart_s1_begintransfer                          (mm_interconnect_0_uart_s1_begintransfer),                    //                                         .begintransfer
		.uart_s1_chipselect                             (mm_interconnect_0_uart_s1_chipselect)                        //                                         .chipselect
	);

	serial_uart_irq_mapper irq_mapper (
		.clk           (clk_clk),                        //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.sender_irq    (nios2_gen2_0_irq_irq)            //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (2),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (nios2_gen2_0_debug_reset_request_reset), // reset_in0.reset
		.reset_in1      (nios2_gen2_0_debug_reset_request_reset), // reset_in1.reset
		.clk            (clk_clk),                                //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),         // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req),     //          .reset_req
		.reset_req_in0  (1'b0),                                   // (terminated)
		.reset_req_in1  (1'b0),                                   // (terminated)
		.reset_in2      (1'b0),                                   // (terminated)
		.reset_req_in2  (1'b0),                                   // (terminated)
		.reset_in3      (1'b0),                                   // (terminated)
		.reset_req_in3  (1'b0),                                   // (terminated)
		.reset_in4      (1'b0),                                   // (terminated)
		.reset_req_in4  (1'b0),                                   // (terminated)
		.reset_in5      (1'b0),                                   // (terminated)
		.reset_req_in5  (1'b0),                                   // (terminated)
		.reset_in6      (1'b0),                                   // (terminated)
		.reset_req_in6  (1'b0),                                   // (terminated)
		.reset_in7      (1'b0),                                   // (terminated)
		.reset_req_in7  (1'b0),                                   // (terminated)
		.reset_in8      (1'b0),                                   // (terminated)
		.reset_req_in8  (1'b0),                                   // (terminated)
		.reset_in9      (1'b0),                                   // (terminated)
		.reset_req_in9  (1'b0),                                   // (terminated)
		.reset_in10     (1'b0),                                   // (terminated)
		.reset_req_in10 (1'b0),                                   // (terminated)
		.reset_in11     (1'b0),                                   // (terminated)
		.reset_req_in11 (1'b0),                                   // (terminated)
		.reset_in12     (1'b0),                                   // (terminated)
		.reset_req_in12 (1'b0),                                   // (terminated)
		.reset_in13     (1'b0),                                   // (terminated)
		.reset_req_in13 (1'b0),                                   // (terminated)
		.reset_in14     (1'b0),                                   // (terminated)
		.reset_req_in14 (1'b0),                                   // (terminated)
		.reset_in15     (1'b0),                                   // (terminated)
		.reset_req_in15 (1'b0)                                    // (terminated)
	);

endmodule
