; xor_swap.asm
; Author: MD Muhtasimul Huq
; This program will swap the values of two variables using XOR operation
; The program follows the algorithm based on Ray Seyfarth's book "Introduction to 64 Bit Assembly Programming for Linux and OS X"
; 1. a = a ^ b
; 2. b = a ^ b
; 3. a = a ^ b


    section .data
a   dq  00000111b
b   dq  00000010b 

    section .text
    global main

main: 
    push    rbp

    mov     rbp,rsp
    mov     rax,[a]             ; move variable a value to rax
    mov     rbx,[b]             ; move variable b value to rbx
    xor     rax, rbx            ; xor rax and rbx and store the result in rax _> rax = rax ^ rbx -> 0000 0111 ^ 0000 0010 = 0000 0101                                                                     
    mov     qword[a],rax        ; store the result in a -> a = 0000 0101
    xor     rax, rbx            ; xor rax and rbx and store the result in rax _> rax = rax ^ rbx -> 0000 0101 ^ 0000 0010 = 0000 0111
    mov     qword[b], rax       ; store the result in b -> b = 0000 0111
    mov     rax,[a]             ; move variable a value to rax -> rax = 0000 0101
    mov     rbx,[b]             ; move variable b value to rbx -> rbx = 0000 0111 
    xor     rax, rbx            ; xor rax and rbx and store the result in rax _> rax = rax ^ rbx -> 0000 0101 ^ 0000 0111 = 0000 0010
    mov     qword[a],rax        ; store the result in a -> a = 0000 0010

    xor     rbx, rbx            ; set rbx to 0
    xor     rax, rax            ; set rax to 0
    leave
    ret




