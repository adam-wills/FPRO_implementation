#include "chu_init.h"

TimerCore _sys_timer(get_slot_addr(BRIDGE_BASE, TIMER_SLOT));
UartCore uart(get_slot_addr(BRIDGE_BASE, UART_SLOT));

unsigned long now_us() {
  return ((unsigned long) _sys_timer.read_time());
}

unsigned long now_ms() {
  return ((unsigned long) _sys_timer.read_time()/1000);
}

void sleep_us(unsigned long int t) {
  _sys_timer.sleep(uint64_t(t));
}

void sleep_ms(unsigned long int t) {
  _sys_timer.sleep(uint64_t(1000*t));
}

void debug_on(const char *str, int n1, int n2) {
  uart.disp("debug: ");
  uart.disp(str);
  uart.disp(n1);
  uart.disp("(0x");
  uart.disp(n1,16);
  uart.disp(") / ");
  uart.disp(n2);
  uart.disp("(0x");
  uart.disp(n2, 16);
  uart.disp(") \n\r");
}

void debug_off() {}
