#OS := $(shell uname -s)

ARCH = 32

CFLAGS_32 = -march=i386 -m32 -Wno-incompatible-library-redeclaration
LFLAGS_32 = -m elf_i386
NFLAGS_32 = -f elf32

CFLAGS = $(CFLAGS_$(ARCH)) -Os
LFLAGS = $(LFLAGS_$(ARCH)) -s
NFLAGS = $(NFLAGS_$(ARCH))

ASM_32 = x86

OBJ = $(patsubst %.c,%.o,$(wildcard *.c)) $(patsubst %.s,%.o,$(wildcard *_$(ASM_$(ARCH)).s))

APP = cat

all: $(APP)

$(APP): $(OBJ)
	ld $(LFLAGS) -o $@ $(OBJ)

%.o: %.c
	clang $(CFLAGS) -c $<

%.o: %.s
	nasm $(NFLAGS) -o $@ $<

clean:
	rm -f $(OBJ)

run: $(APP)
	./$< test.txt

debug: $(APP)
	gdb ./$< test.txt

dump: $(APP)
	objdump -d -M intel $< | less

