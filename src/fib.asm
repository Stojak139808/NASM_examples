    global main

    extern scanf
    extern printf

    section .text

main:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32

    call    get_n
    mov     [rbp - 8], rax

    mov     qword [rbp - 16], 0
    mov     qword [rbp - 24], 1
.fib_loop:
    mov     rax, [rbp - 16]
    cmp     rax, [rbp - 8]
    jge     .fib_loop_end

    mov     rcx, rdx
    add     rdx, [rbp - 24]
    mov     [rbp - 24], rcx
    push    rdx
    call    print_n
    pop     rdx

    inc     qword [rbp - 16]
    jmp     .fib_loop

.fib_loop_end:

    leave
    ret

print_n:    ; n passed on stack
    push    rbp
    mov     rbp, rsp

    lea     rdi, [rel .print_fmt]
    mov     rsi, [rbp + 16]
    xor     rdx, rdx
    xor     rcx, rcx
    xor     rax, rax
    call    printf  wrt ..plt

    pop     rbp
    ret

.print_fmt:     db  "%d", 10, 0


get_n:      ; get an integer with scanf and return it in rax
    push    rbp
    mov     rbp, rsp
    sub     rsp, 16

    lea     rdi, [rel .scanf_fmt]
    lea     rsi, [rbp - 8]
    xor     rdx, rdx
    xor     rcx, rcx
    xor     rax, rax
    call    scanf  wrt ..plt

    lea     rsi, [rbp - 8]
    mov     rax, [rsi]

    leave
    ret

.scanf_fmt:     db  "%ld", 0
