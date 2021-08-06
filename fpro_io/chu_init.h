#include "chu_io_rw.h"
#include "chu_io_map.h"
#include "timer_core.h"
#include "uart_core.h"

extern UartCore uart;

#define TIMER_SLOT S0_SYS_TIMER
#define UART_SLOT  S1_UART1

// timing functions
unsigned long now_us();
unsigned long now_ms();
void sleep_us(unsigned long int t);
void sleep_ms(unsigned long int t);

//debug functions
void debug_off();
void debug_on(const char *str, int n1, int n2);

#ifndef _DEBUG
#define debug(str, n1, n2) debug_off()
#endif

#ifdef _DEBUG
#define debug(str, n1, n2) debug_on((sstr), (n1), (n2))
#endif

// bit-manipulation macros
#define bit_set(data, n) ((data) |= (1UL << (n)))
#define bit_clear(data, n) ((data) &= ~(1UL << (n)))
#define bit_toggle(data, n) ((data) ^= (1UL << (n)))
#define bit_read(data, n) (((data) >> (n)) & 0x01)
#define bit_write(data, n, bitval) \\
        (bitval ? bit_set(data, n) : bit_clear(data, n))
#define bit(n) (1UL << (n))

//#endif
