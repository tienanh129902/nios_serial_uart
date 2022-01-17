`timescale 1 ps / 1 ps
module top (
	input clk,
	input rx,
	output tx,
	output [7:0]led
);


serial_uart u0 (
		.clk_clk                        (clk),                        //clk.clk
		.led_external_connection_export (led), //  led_external_connection.export
		.uart_external_connection_rxd   (rx),   // uart_external_connection.rxd
		.uart_external_connection_txd   (tx)    //                         .txd
	);
endmodule
