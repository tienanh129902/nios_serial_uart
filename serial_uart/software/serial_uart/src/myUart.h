#ifndef _MYUART_H_
#define _MYUART_H_

void UART_init(unsigned int UART_address,unsigned int BaudRate);
void UART_isr(void *context, unsigned int id);
unsigned char isEmptyUart(void);
unsigned char UART_getChar();
unsigned char UART_putChar(unsigned int UART_address, unsigned char in_char);
unsigned char UART_putString(unsigned int UART_address, unsigned char *in_char);

#endif //_MYUART_H_
