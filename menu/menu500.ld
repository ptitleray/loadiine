OUTPUT(build/menu500.elf);

SECTIONS {
	.text 0x011DBC00 : {
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
PROVIDE(entry_point = 0x1005CB00);

/* System */
PROVIDE(_Exit = 0x0101C970);
PROVIDE(OSFatal = 0x01030ECC);
PROVIDE(DCFlushRange = 0x01023A00);
PROVIDE(memset = 0x0103544C);
PROVIDE(memcpy = 0x01035460);
PROVIDE(__gh_errno_ptr = 0x0103F2CC);
PROVIDE(GX2WaitForVsync = 0x01150868);
PROVIDE(__os_snprintf = 0x0102ECE0);
PROVIDE(title_id = 0x10013010);

/* Alloc */
PROVIDE(MEMAllocFromDefaultHeapEx = 0x1004E2D0);
PROVIDE(MEMAllocFromDefaultHeap = 0x100B41F8);
PROVIDE(MEMFreeToDefaultHeap = 0x100B41FC);

/* Libs */
PROVIDE(OSDynLoad_FindExport = 0x0102B3E4);
PROVIDE(OSDynLoad_Acquire = 0x01029F70);

/* Screen */
PROVIDE(OSScreenInit = 0x01039AD8);
PROVIDE(OSScreenGetBufferSizeEx = 0x01039B74);
PROVIDE(OSScreenSetBufferEx = 0x01039B8C);
PROVIDE(OSScreenClearBufferEx = 0x01039CE8);
PROVIDE(OSScreenFlipBuffersEx = 0x01039C28);
PROVIDE(OSScreenPutFontEx = 0x0103A16C);

/* VPAD */
PROVIDE(VPADRead = 0x011283D0);

/* FS Functions */
PROVIDE(FSAddClient = 0x01066D80);
PROVIDE(FSInitCmdBlock = 0x01066FEC);
PROVIDE(FSGetMountSource = 0x0106D180);
PROVIDE(FSMount = 0x0106D270);
PROVIDE(FSUnmount = 0x0106D2E8);
PROVIDE(FSOpenDir = 0x0106DB58);
PROVIDE(FSReadDir = 0x0106DC48);
PROVIDE(FSOpenFile = 0x0106D4D8);
PROVIDE(FSReadFile = 0x0106D5D0);
PROVIDE(FSChangeDir = 0x0106D458);
PROVIDE(FSMakeDir = 0x0106DDA8);
PROVIDE(FSCloseDir = 0x0106DBC8);
PROVIDE(FSCloseFile = 0x0106D550);
PROVIDE(FSGetStat = 0x0106E290);
PROVIDE(FSMakeDir = 0x0106DDA8);
