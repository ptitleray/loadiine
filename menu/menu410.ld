OUTPUT(build/menu410.elf);

SECTIONS {
	.text 0x011D9800 : {
		*(.text._start);
		*(.text*);
	}
	.rodata : {
		*(.rodata*);
	}
	/DISCARD/ : {
		*(*);
	}
}

/* Main */
PROVIDE(entry_point = 0x1005A8C0);

/* System */
PROVIDE(_Exit = 0x0101C540);
PROVIDE(OSFatal = 0x0102D01C);
PROVIDE(DCFlushRange = 0x01020EAC);
PROVIDE(memset = 0x01030ED0);
PROVIDE(memcpy = 0x01030EE4);
PROVIDE(__gh_errno_ptr = 0x0103A96C);
PROVIDE(GX2WaitForVsync = 0x011454BC);
PROVIDE(__os_snprintf = 0x0102B9AC);
PROVIDE(title_id = 0x1000ECB0);

/* Alloc */
PROVIDE(MEMAllocFromDefaultHeapEx = 0x10049EDC);
PROVIDE(MEMAllocFromDefaultHeap = 0x100ADC28);
PROVIDE(MEMFreeToDefaultHeap = 0x100ADC2C);

/* Libs */
PROVIDE(OSDynLoad_FindExport = 0x01028460);
PROVIDE(OSDynLoad_Acquire = 0x01026E60);

/* Screen */
PROVIDE(OSScreenInit = 0x010352F8);
PROVIDE(OSScreenGetBufferSizeEx = 0x01035394);
PROVIDE(OSScreenSetBufferEx = 0x010353AC);
PROVIDE(OSScreenClearBufferEx = 0x01035500);
PROVIDE(OSScreenFlipBuffersEx = 0x01035440);
PROVIDE(OSScreenPutFontEx = 0x01035984);

/* VPAD */
PROVIDE(VPADRead = 0x0111D5DC);

/* FS Functions */
PROVIDE(FSAddClient = 0x01061290);
PROVIDE(FSInitCmdBlock = 0x01061498);
PROVIDE(FSGetMountSource = 0x01066564);
PROVIDE(FSMount = 0x01066654);
PROVIDE(FSUnmount = 0x010666CC);
PROVIDE(FSOpenDir = 0x01066F3C);
PROVIDE(FSReadDir = 0x0106702C);
PROVIDE(FSOpenFile = 0x010668BC);
PROVIDE(FSReadFile = 0x010669B4);
PROVIDE(FSChangeDir = 0x0106683C);
PROVIDE(FSMakeDir = 0x0106718C);
PROVIDE(FSCloseDir = 0x01066FAC);
PROVIDE(FSCloseFile = 0x01066934);
PROVIDE(FSGetStat = 0x01067674);
PROVIDE(FSMakeDir = 0x0106718C);
