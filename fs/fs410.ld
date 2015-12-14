OUTPUT(fs410.elf);

SECTIONS {
	.text 0x011DC000 : {
		server_ip = .;
		. = . + 4;
		*(.text._start);
		*(.text*);
		*(.magicptr*);
	}
	.magic : {
		*(.magic*);
	}
	.rodata : {
		*(.rodata*);
	}
	/DISCARD/ : {
		*(*);
	}
}

/* FSA methods */
PROVIDE(FSAInit = 0x01059B1C);
PROVIDE(FSAShutdown = 0x01059BE4);
PROVIDE(FSAAddClient = 0x0105E340);
PROVIDE(FSADelClient = 0x01059D10);
PROVIDE(FSAOpenFile = 0x0105B464);

/* FS base methods */
PROVIDE(FSInit = 0x01060D70);
PROVIDE(FSShutdown = 0x01060EA0);
PROVIDE(FSAddClientEx = 0x01060F5C);
PROVIDE(FSDelClient = 0x0106129C);
PROVIDE(FSInitCmdBlock = 0x01061498);

/* FS methods for path replacement */
PROVIDE(FSOpenFile = 0x010668BC);
PROVIDE(FSOpenFileAsync = 0x01062924);
PROVIDE(FSOpenDir = 0x01066F3C);
PROVIDE(FSOpenDirAsync = 0x010634B0);
PROVIDE(FSChangeDir = 0x0106683C);
PROVIDE(FSChangeDirAsync = 0x01062870);
PROVIDE(FSGetStat = 0x01067674);
PROVIDE(FSGetStatAsync = 0x01064070);
PROVIDE(FSMakeDir = 0x0106718C);
PROVIDE(FSMakeDirAsync = 0x0106389C);
PROVIDE(FSRename = 0x0106728C);
PROVIDE(FSRenameAsync = 0x01063A08);
PROVIDE(FSRemove = 0x0106720C);
PROVIDE(FSRemoveAsync = 0x01063954);
PROVIDE(FSFlushQuota = 0x01067374);
PROVIDE(FSFlushQuotaAsync = 0x01063CC0);
PROVIDE(FSGetFreeSpaceSize = 0x010676E4);
PROVIDE(FSGetFreeSpaceSizeAsync = 0x01064084);
PROVIDE(FSRollbackQuota = 0x010674F4);
PROVIDE(FSRollbackQuotaAsync = 0x01063D74);

/* FS methods - Used by Dynamic RPL loading */
PROVIDE(FSReadFile = 0x010669B4);
PROVIDE(FSCloseFile = 0x01066934);

/* FS methods - log */
PROVIDE(FSCloseFile_log = 0x01066934);
PROVIDE(FSCloseFileAsync_log = 0x01062A04);
PROVIDE(FSSetPosFile_log = 0x01066DDC);
PROVIDE(FSGetPosFile_log = 0x01066D6C);
PROVIDE(FSGetStatFile_log = 0x01066E4C);
PROVIDE(FSIsEof_log = 0x01066EBC);
PROVIDE(FSReadFile_log = 0x010669B4);
PROVIDE(FSReadFileWithPos_log = 0x01066A40);
PROVIDE(FSReadFileAsync_log = 0x01062D64);
PROVIDE(FSCloseDir_log = 0x01066FAC);
PROVIDE(FSGetCwd_log = 0x0106711C);
PROVIDE(FSReadDir_log = 0x0106702C);
PROVIDE(FSFlushFile_log = 0x01066CEC);
PROVIDE(FSGetErrorCodeForViewer_log = 0x0106437C);
PROVIDE(FSGetLastError_log = 0x01064340);
PROVIDE(FSGetLastErrorCodeForViewer_log = 0x01064674);
PROVIDE(FSSetStateChangeNotification_log = 0x01061664);
PROVIDE(FSSetCmdPriority_log = 0x01064760);
PROVIDE(FSTruncateFile_log = 0x01066C6C);
PROVIDE(FSWriteFile_log = 0x01066AD4);
PROVIDE(FSWriteFileAsync_log = 0x01062F28);
PROVIDE(FSWriteFileWithPos_log = 0x01066B60);
PROVIDE(FSGetVolumeState_log = 0x01061630);

/* FS methods for sd card */
PROVIDE(FSGetMountSource = 0x01066564);
PROVIDE(FSMount = 0x01066654);

/* GX2 methods */
PROVIDE(GX2WaitForVsync = 0x011454BC);

/* Socket methods */
PROVIDE(socket_lib_init = 0x010B44D4);
PROVIDE(socket = 0x010B5DA0);
PROVIDE(socketclose = 0x010B5EEC);
PROVIDE(connect = 0x010B49FC);
PROVIDE(send = 0x010B5528);
PROVIDE(recv = 0x010B4CC0);

/* OS methods */
PROVIDE(OSDynLoad_Acquire = 0x01026E60);
/*PROVIDE(OSDynLoad_IsModuleLoaded = 0x0102A504); Don't exist on 410 0x0102A504 for 532 */
PROVIDE(OSDynLoad_GetModuleName = 0x01028630);
PROVIDE(__os_snprintf = 0x0102B9AC);
PROVIDE(OSFatal = 0x0102D01C);
PROVIDE(OSSetExceptionCallback = 0x0103E5BC);
PROVIDE(DCFlushRange = 0x01020EAC);

/* Standard library methods */
PROVIDE(memcpy = 0x01030EE4);
PROVIDE(memset = 0x01030ED0);
PROVIDE(MEMAllocFromDefaultHeapEx = 0x10049EDC);
PROVIDE(MEMAllocFromDefaultHeap = 0x100ADC28);
PROVIDE(MEMFreeToDefaultHeap = 0x100ADC2C);

/* OS data */
PROVIDE(title_id = 0x1000ECB0);
