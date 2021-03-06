#include "system.h"
#include "myUart.h"
#include "altera_avalon_uart_regs.h"

#define RX_BUFFER_SIZE 1024
#define TX_BUFFER_SIZE 1024

unsigned short TxHead = 0;
unsigned short TxTail = 0;

unsigned char tx_buffer[TX_BUFFER_SIZE];
unsigned short RxHead = 0;

unsigned short RxTail = 0;
unsigned char rx_buffer[RX_BUFFER_SIZE];
unsigned int UART_add;

void UART_init(unsigned int UART_address, unsigned int BaudRate)
{
    unsigned int divisor;
    divisor = (ALT_CPU_FREQ / BaudRate) + 1;
    IOWR_ALTERA_AVALON_UART_DIVISOR(UART_address, divisor);
    IOWR_ALTERA_AVALON_UART_CONTROL(UART_address, ALTERA_AVALON_UART_CONTROL_RRDY_MSK);
    UART_add = UART_address;
}

void UART_isr(void *context, unsigned int id)

{
    int sr;
    sr = IORD_ALTERA_AVALON_UART_STATUS(UART_add);
    if (sr & ALTERA_AVALON_UART_STATUS_RRDY_MSK)
    {
        rx_buffer[RxHead] = IORD_ALTERA_AVALON_UART_RXDATA(UART_add);
        IOWR_ALTERA_AVALON_UART_STATUS(UART_add, 0);
        if (++RxHead > (RX_BUFFER_SIZE - 1))
            RxHead = 0;
    }

    if (sr & ALTERA_AVALON_UART_STATUS_TRDY_MSK)
    {
        if (IORD_ALTERA_AVALON_UART_CONTROL(UART_add) & ALTERA_AVALON_UART_CONTROL_TRDY_MSK)
        {
            if (TxTail != TxHead)
            {
                IOWR_ALTERA_AVALON_UART_TXDATA(UART_add, tx_buffer[TxTail]);
                if (++TxTail > (TX_BUFFER_SIZE - 1))
                    TxTail = 0;
            }
            else
                IOWR_ALTERA_AVALON_UART_CONTROL(UART_add, ALTERA_AVALON_UART_CONTROL_RRDY_MSK);
        }
    }
}


unsigned char isEmptyUart(void)
{
    if (RxHead == RxTail)
        return 1;
    return 0;
}

unsigned char UART_getChar()
{
    unsigned char rxChar;
    /* buffer is empty */
    rxChar = rx_buffer[RxTail];
    if (++RxTail > (RX_BUFFER_SIZE - 1))
        RxTail = 0;
    return rxChar;
}


unsigned char UART_putChar(unsigned int UART_address, unsigned char in_char)
{
    unsigned short size;
    unsigned int z;
    z = IORD_ALTERA_AVALON_UART_STATUS(UART_address) & ALTERA_AVALON_UART_STATUS_TRDY_MSK;
    if ((TxHead == TxTail) && z)
        IOWR_ALTERA_AVALON_UART_TXDATA(UART_address, in_char);
    else
    {
        if (TxHead >= TxTail)
            size = TxHead - TxTail;
        else
            size = ((TX_BUFFER_SIZE - 1) - TxTail) + TxHead;
        if (size > (TX_BUFFER_SIZE - 3))
            return (-1);
        tx_buffer[TxHead] = in_char;
        if (++TxHead > (TX_BUFFER_SIZE - 1))
            TxHead = 0;
        z = IORD_ALTERA_AVALON_UART_CONTROL(UART_address) | ALTERA_AVALON_UART_CONTROL_TRDY_MSK;
        IOWR_ALTERA_AVALON_UART_CONTROL(UART_address, z);
    }
    return 1;
}

unsigned char UART_putString(unsigned int UART_address, unsigned char *in_char)
{
	while(*in_char)
	{
		UART_putChar(UART_address,*in_char++);
	}
	return 1;
}
