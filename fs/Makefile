
PATH := $(DEVKITPPC)/bin:$(PATH)

PREFIX ?= powerpc-eabi-
LD := $(PREFIX)ld
AS := $(PREFIX)as
CC := $(PREFIX)gcc
OBJDUMP ?= $(PREFIX)objdump
OBJCOPY ?= $(PREFIX)objcopy

SFLAGS := -mgekko -mregnames

# -O2: optimise lots
# -Wall: generate lots of warnings
# -x c: compile as C code
# -std=gnu99: use the C99 standard with GNU extensions
# -ffreestanding: we don't have libc; don't expect we do
# -mrvl: enable wii/gamecube compilation
# -mcpu=750: enable processor specific compilation
# -meabi: enable eabi specific compilation
# -mhard-float: enable hardware floating point instructions
# -fshort-wchar: use 16 bit whcar_t type in keeping with Wii executables
# -msdata-none: do not use r2 or r13 as small data areas
# -memb: enable embedded application specific compilation
# -ffunction-sections: split up functions so linker can garbage collect
# -fdata-sections: split up data so linker can garbage collect
CFLAGS := -Os -nostdinc -nostdlib -Wall -x c -std=gnu99 -nostdlib \
          -ffreestanding \
          -mrvl -mcpu=750 -meabi -mhard-float -fshort-wchar \
          -msdata=none -memb -ffunction-sections -fdata-sections \
          -Wno-unknown-pragmas -Wno-strict-aliasing \

SRC := $(wildcard *.S) $(wildcard *.c)
OBJ := $(patsubst %.S,%.o,$(patsubst %.c,%.o,$(SRC)))

# Simulate an order only dependency
BUILD_REQ := $(filter-out $(wildcard build),build)
BIN_REQ := $(filter-out $(wildcard bin),bin)

all: build/fs410.elf copy

../installer/fs%.h: build/fs%.text.bin build/fs%.magic.bin $(BIN_REQ)
	xxd -i build/fs$*.magic.bin | sed "s/unsigned/static const unsigned/g;s/fs$*/fs/g" > $@
	xxd -i build/fs$*.text.bin | sed "s/unsigned/static const unsigned/g;s/fs$*/fs/g" >> $@

build/fs%.text.bin: build/fs%.elf $(BUILD_REQ)
	$(OBJCOPY) -j .text -O binary $< $@
build/fs%.magic.bin: build/fs%.elf $(BUILD_REQ)
	$(OBJCOPY) -j .magic -O binary $< $@

build/fs%.elf: fs%.ld $(OBJ) $(BUILD_REQ)
	$(LD) -o $@ -T $< $(OBJ) -s -L"$(DEVKITPPC)/lib/gcc/powerpc-eabi/4.8.2" -lgcc

build/%.o: %.c $(BUILD_REQ)
	$(CC) -c $(CFLAGS) -o $@ $+
build/%.o: %.S $(BUILD_REQ)
	$(AS) $(SFLAGS) -o $@ $+

bin:
	mkdir $@
build:
	mkdir $@

copy:
	cp build/fs410.elf ../loadiine3/bin/

clean:
	rm -rf $(wildcard build) $(wildcard bin) $(wildcard ../loadiine3/fs410.h)
