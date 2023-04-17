;   this code reads an integer for stdin to some place in memory (n)
;   and then calls printf to output it to stdout, from memory

            global      main

            extern      scanf
            extern      printf

            section     .text
main:
            push    rbp
            call    get_n
            call    print_n
            pop     rbp
            ret

print_n:
            push    rbp
            mov     rbp, rsp
            push    rdi
            push    rsi
            push    rdx
            push    rcx

            mov     rdx, 0  ; if these are not `0` then printf outputs nothing
            mov     rcx, 0  ; don't know why yet, probaby due to variable arg
                            ; number
            lea     rdi, [rel printf_fmt]
            lea     rax, [rel n]
            mov     rsi, [rax]
            xor     rax, rax
            call    printf wrt ..plt

            pop     rcx
            pop     rdx
            pop     rsi
            pop     rdi
            pop     rbp
            ret

get_n:
            push    rbp
            push    rdi
            push    rsi

            lea     rdi, [rel scanf_fmt]
            lea     rsi, [rel n]
            xor     rax, rax
            call    scanf wrt ..plt

            pop     rsi
            pop     rdi
            pop     rbp

            ret

            section .data

n:          dd  0
printf_fmt: db  "n: %d", 10, 0
scanf_fmt:  db  "%d", 0
