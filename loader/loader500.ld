OUTPUT(build/loader500.elf);

SECTIONS {
	.text 0x011DD000 : {
            *(.text._start);
            *(.text*);
	}
        .magic : {
            *(.magic*);
        }
	/DISCARD/ : {
            *(*);
	}
}

/* Instructions addresses to replace by "bl 0x????????   - instr addr    -  original instruction              	    => comment */
/* This are the real functions that are used for our purpose */ 
PROVIDE(LiWaitIopComplete                                = 0x0100FBC4);
PROVIDE(LiWaitIopCompleteWithInterrupts                  = 0x0100FAB0);
PROVIDE(LiCheckAndHandleInterrupts                       = 0x0100431C);
PROVIDE(Loader_SysCallGetProcessIndex                    = 0x010000A8);
PROVIDE(LiLoadAsync                                      = 0x0100FC7C);
PROVIDE(strncpy                                          = 0x010102B0);
PROVIDE(strnlen                                          = 0x01010300);

/* This are just addresses to the real functions which we only need as reference */
PROVIDE(addr_LiWaitOneChunk                              = 0x010007EC);
PROVIDE(addr_LiBounceOneChunk                            = 0x010003B0);