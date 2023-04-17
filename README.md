# NASM examples with C

This repository contains a bunch of NASM examplse, mostly to use it together
with C.

The idea is, compile x86 asm with nasm:

```
nasm -felf64 file.asm
```

and then link it with gcc:

```
gcc file.o -o bin
```

and if we wrote the code correctly (a proper PIE code), gcc should throw no
errors and output `bin`.
