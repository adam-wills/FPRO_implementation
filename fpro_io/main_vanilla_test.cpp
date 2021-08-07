#define _DEBUG
#include "chu_init.h"
#include "gpio_core.h"

void timer_check(GpoCore *led_p) {
  int i;

  for (i = 0; i < 5; i++) {
    led_p->write(0xffff);
    sleep_ms(500);
    led_p->write(0x0000);
    sleep_ms(500);
    debug("timer check - (loop #)/now: ", i, now_ms());
  }
}

void led_check(GpoCore *led_p, int n) {
  int i;

  for (i = 0; i < n; i++) {
    led_p->write(1, i);
    sleep_ms(200);
    led_p->write(0,i);
    sleep_ms(200);
  }
}

void sw_check(GpoCore *led_p, GpiCore *sw_p) {
  int i, s;

  s = sw_p->read();
  for (i = 0; i < 50; i++) {
    led_p->write(s);
    sleep_ms(100);
    led_p->write(0x0000);
    sleep_ms(100);
  }
}

void uart_check() {
  static int loop = 0;

  uart.disp_str("uart test #");
  uart.disp_num(loop);
  uart.disp_str("\n\r");
  loop++;
}

// instantiate switch, led
GpoCore led(get_slot_addr(BRIDGE_BASE, S2_LED));
GpiCore sw(get_slot_addr(BRIDGE_BASE, S3_SW));

int main() {
  while (1) {
    timer_check(&led);
    led_check(&led,16);
    sw_check(&led, &sw);
    uart_check();
    debug("main - switch value / up time : ",sw.read(), now_ms());
  }
}
