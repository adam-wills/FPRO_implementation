'ifndef _CHU_IO_MAP_INCLUDED
'define _CHU_IO_MAP_INCLUDED

// system clock rate in MHz
'define SYS_CLK_FREQ 50

// io base address
'define BRIDGE_BASE 0xc0000000

// slot module definition
// format: SLOT_ModuleType_Name
'define S0_SYS_TIMER   0
'define S1_UART1       1
'define S2_LED         2
'define S3_SW          3
//. . .
'endif //_CHU_IO_MAP
