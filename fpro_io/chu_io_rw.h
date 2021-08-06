#ifndef _CHU_IO_RW_H_INCLUDED
#define _CHU_IO_RW_H_INCLUDED

#include <inttypes.h>
#ifdef __cplusplus
extern "C" {
#endif

#define io_read(base_addr, offset) \
  (*(volatile uint32_t *))((base_addr)+4*(offset)))

#define io_write(base_addr, offset, data) \
  (*(volatile uint32_t *))((base_addr) + 4*(offset)) = (data))

#define get_slot_addr(mmio_base, slot) \
  ((uint32_t)((mmio_base) + (slot)*32*4))

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* _CHU_IO_RW_H_INCLUDED */
