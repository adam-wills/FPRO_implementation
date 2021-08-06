#include "chu_io_rw.h"

class GpoCore {
  /* register map */
  enum {
    DATA_REG = 0 // data register
  };
public:
  GpoCore(uint32_t core_base_addr);  // constructor
  ~GpoCore();
  /* methods */
  void write(uint32_t data);              // write 32-bit word
  void write(int bit_value, int bit_pos); // write single bit
private:
  uint32_t base_addr;
  uint32_t wr_data;
};

class GpiCore {
  /* register map */
  enum {
    DATA_REG = 0 // data register
  };
public:
  GpiCore(uint32_t core_base_addr);
  ~GpiCore();
  /* methods */
  uint32_t read();
  int read(int bit_pos);
private:
  uint32_t base_addr;
};
