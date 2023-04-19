    global power
    global fast_power

    section .text

; O(n) power
power:
    push    rbp
    mov     rbp, rsp

; check for a^0
    cmp     rsi, 0
    jne     .not_zero
    mov     rax, 1
    jmp     .stop
.not_zero:

; check for a^-n
    jg      .not_negative
    mov     rax, 0
    jmp     .stop
.not_negative:

; calculate a^n
    mov     rax, rdi
.pow_loop:
    mul     rdi
    dec     rsi
    cmp     rsi, 1
    jg      .pow_loop

.stop:
    leave
    ret

; O(log_2(n)) power
fast_power:
    push    rbp
    mov     rbp, rsp

; check for a^0
    cmp     rsi, 0
    jne     .not_zero
    mov     rax, 1
    jmp     .stop
.not_zero:

; check for a^-n
    jg      .not_negative
    mov     rax, 0
    jmp     .stop
.not_negative:

; calculate a^n
    mov     rcx, 1
.pow_loop:
    cmp     rsi, 0
    jbe     .finish_loop

    mov     rdx, rsi
    and     rdx, 0x1
    jnz     .not_even
.even:
    shr     rsi, 1
    mov     rax, rdi
    mul     rdi
    mov     rdi, rax
    jmp     .pow_loop
.not_even:
    dec     rsi
    mov     rax, rcx
    mul     rdi
    mov     rcx, rax
    jmp     .even

.finish_loop:
    mov     rax, rcx

.stop:
    leave
    ret
