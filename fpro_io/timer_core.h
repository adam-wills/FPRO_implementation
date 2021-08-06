#include "chu_io_rw.h"

class TimerCore {
  /* register map */
  enum {
    COUNTER_LOWER_REG = 0,
    COUNTER_UPPER_REG = 1,
    CTRL_REG          = 2
  };
  enum {
    GO_FIELD  = 0x00000001, // bit 0 of ctrl_reg: enable
    CLR_FIELD = 0x00000002  // bit 1 of ctrl_reg: clear
  };
public:
  TimerCore(uint32_t core_base_addr);
  ~TimerCore();
  /* methods */
  void pause();
  void go();
  void clear();
  uint64_t read_tick();
  uint64_t read_time();
  void sleep(uint64_t us);
private:
  uint32_t base_addr;
  uint32_t ctrl;
}
