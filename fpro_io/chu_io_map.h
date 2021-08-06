#ifndef _CHU_IO_MAP_INCLUDED
#define _CHU_IO_MAP_INCLUDED

#ifdef __cplusplus
extern "C" {
#endif

#define SYS_CLK_FREQ 50

//probs need to change this
#define BRIDGE_BASE 0xc000_0000

// slot module def
#define S0_SYS_TIMER 0
#define S1_UART1     1
#define S2_LED       2
#define S3_SW        3
// more defs here

#ifdef __cplusplus
} // extern "C"
#endif

#endif // _CHU_IO_MAP_INCLUDED
