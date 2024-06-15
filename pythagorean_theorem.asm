    section .data
a   dq      3
b   dq      4

    section .text
    global main

main:
    mov     rax,[a]     ; move variable a to rax
    imul    rax, rax    ; square rax
    mov     rbx, [b]    ; move variable b to rbx
    imul    rbx, rbx    ; square rbx 
    add     rax, rbx    ; rax = rax + rbx
    leave 
    ret
