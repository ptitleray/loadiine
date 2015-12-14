OUTPUT(build/loader410.elf);

SECTIONS {
	.text 0x011DAC00 : {
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
PROVIDE(LiWaitIopComplete                                = 0x0100F78C);
PROVIDE(LiWaitIopCompleteWithInterrupts                  = 0x0100F678);
PROVIDE(LiCheckAndHandleInterrupts                       = 0x01004074);
/*PROVIDE(Loader_SysCallGetProcessIndex                    = 0x010000A8); Don't exist for 410, not used */
PROVIDE(LiLoadAsync                                      = 0x0100F844);
PROVIDE(strncpy                                          = 0x0100FE78);
PROVIDE(strnlen                                          = 0x0100FEC8);

/* This are just addresses to the real functions which we only need as reference */
PROVIDE(addr_LiWaitOneChunk                              = 0x010007F8);
PROVIDE(addr_LiBounceOneChunk                            = 0x010003A4);