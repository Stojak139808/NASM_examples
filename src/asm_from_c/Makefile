CC := gcc
LD := gcc
NASM := nasm

ASM_FILES := pow.asm
C_FILES := main.c

OBJ := $(ASM_FILES:%.asm=%.o)
OBJ += $(C_FILES:%.c=%.o)

BIN := bin

all: $(BIN)

$(BIN): $(OBJ)
	$(LD) $^ -o $@

%.o: %.c
	$(CC) -c $< -o $@

%.o: %.asm
	$(NASM) -felf64 $< -o $@

.PHONY: all
