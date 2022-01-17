	serial_uart u0 (
		.clk_clk                        (<connected-to-clk_clk>),                        //                      clk.clk
		.led_external_connection_export (<connected-to-led_external_connection_export>), //  led_external_connection.export
		.uart_external_connection_rxd   (<connected-to-uart_external_connection_rxd>),   // uart_external_connection.rxd
		.uart_external_connection_txd   (<connected-to-uart_external_connection_txd>)    //                         .txd
	);

