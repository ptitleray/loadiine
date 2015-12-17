OUTPUT(fs500.elf);

SECTIONS {
	.text 0x011DE400 : {
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
PROVIDE(FSAInit = 0x0105EF88);
PROVIDE(FSAShutdown = 0x0105F050);
PROVIDE(FSAAddClient = 0x010637B0);
PROVIDE(FSADelClient = 0x0105F180);
PROVIDE(FSAOpenFile = 0x010608D4);

/* FS methods */
PROVIDE(FSInit = 0x010666FC);
PROVIDE(FSShutdown = 0x010668B0);
PROVIDE(FSAddClientEx = 0x01066974);
PROVIDE(FSDelClient = 0x01066D8C);
PROVIDE(FSInitCmdBlock = 0x01066FEC);

/* FS methods for path replacement */
PROVIDE(FSOpenFile = 0x0106D4D8);
PROVIDE(FSOpenFileAsync = 0x010685DC);
PROVIDE(FSOpenDir = 0x0106DB58);
PROVIDE(FSOpenDirAsync = 0x010692D8);
PROVIDE(FSChangeDir = 0x0106D458);
PROVIDE(FSChangeDirAsync = 0x010684D8);
PROVIDE(FSGetStat = 0x0106E290);
PROVIDE(FSGetStatAsync = 0x0106A314);
PROVIDE(FSMakeDir = 0x0106DDA8);
PROVIDE(FSMakeDirAsync = 0x01069780);
PROVIDE(FSRename = 0x0106DEA8);
PROVIDE(FSRenameAsync = 0x0106998C);
PROVIDE(FSRemove = 0x0106DE28);
PROVIDE(FSRemoveAsync = 0x01069888);
PROVIDE(FSFlushQuota = 0x0106DF90);
PROVIDE(FSFlushQuotaAsync = 0x0106A07C);
PROVIDE(FSGetFreeSpaceSize = 0x0106E300);
PROVIDE(FSGetFreeSpaceSizeAsync = 0x0106A328);
PROVIDE(FSRollbackQuota = 0x0106E110);
PROVIDE(FSRollbackQuotaAsync = 0x01069E70);

/* FS methods - Used by Dynamic RPL loading */
PROVIDE(FSReadFile = 0x0106D5D0);
PROVIDE(FSCloseFile = 0x0106D550);

/* FS methods - log */
PROVIDE(FSCloseFile_log = 0x0106D550);
PROVIDE(FSCloseFileAsync_log = 0x01068754);
PROVIDE(FSSetPosFile_log = 0x0106D9F8);
PROVIDE(FSGetPosFile_log = 0x0106D988);
PROVIDE(FSGetStatFile_log = 0x0106DA68);
PROVIDE(FSIsEof_log = 0x0106DAD8);
PROVIDE(FSReadFile_log = 0x0106D5D0);
PROVIDE(FSReadFileWithPos_log = 0x0106D65C);
PROVIDE(FSReadFileAsync_log = 0x01068B0C);
PROVIDE(FSCloseDir_log = 0x0106DBC8);
PROVIDE(FSGetCwd_log = 0x0106DD38);
PROVIDE(FSReadDir_log = 0x0106DC48);
PROVIDE(FSFlushFile_log = 0x0106D908);
PROVIDE(FSGetErrorCodeForViewer_log = 0x0106A790);
PROVIDE(FSGetLastError_log = 0x0106A754);
PROVIDE(FSGetLastErrorCodeForViewer_log = 0x0106AB94);
PROVIDE(FSSetStateChangeNotification_log = 0x010671E0);
PROVIDE(FSSetCmdPriority_log = 0x0106AC80);
PROVIDE(FSTruncateFile_log = 0x0106D888);
PROVIDE(FSWriteFile_log = 0x0106D6F0);
PROVIDE(FSWriteFileAsync_log = 0x01068D28);
PROVIDE(FSWriteFileWithPos_log = 0x0106D77C);
PROVIDE(FSGetVolumeState_log = 0x010671AC);

/* FS methods for sd card */
PROVIDE(FSGetMountSource = 0x0106D180);
PROVIDE(FSMount = 0x0106D270);

/* GX2 methods */
PROVIDE(GX2WaitForVsync = 0x01150868);

/* Socket methods */
PROVIDE(socket_lib_init = 0x010BF2F4);
PROVIDE(socket = 0x010C11C8);
PROVIDE(socketclose = 0x010C1314);
PROVIDE(connect = 0x010BF828);
PROVIDE(send = 0x010C06AC);
PROVIDE(recv = 0x010BFAEC);

/* OS methods */
PROVIDE(OSDynLoad_Acquire = 0x01029F70);
PROVIDE(OSDynLoad_IsModuleLoaded = 0x0102A158);
PROVIDE(OSDynLoad_GetModuleName = 0x0102B5B4);
PROVIDE(__os_snprintf = 0x0102ECE0);
PROVIDE(OSFatal = 0x01030ECC);
PROVIDE(OSSetExceptionCallback = 0x01042F30);
PROVIDE(DCFlushRange = 0x01023A00);

/* Standard library methods */
PROVIDE(memcpy = 0x01035460);
PROVIDE(memset = 0x0103544C);
PROVIDE(MEMAllocFromDefaultHeapEx = 0x1004E2D0);
PROVIDE(MEMAllocFromDefaultHeap = 0x100B41F8);
PROVIDE(MEMFreeToDefaultHeap = 0x100B41FC);

/* OS data */
PROVIDE(title_id = 0x10013010);
