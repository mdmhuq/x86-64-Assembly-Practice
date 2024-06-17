; grade_average.asm
; author:  MD Muhtasimul Huq
; This program calculates the average of four grades and prints it to the screen
; The grades are stored in the variables a, b, c, and d
; The average is stored in the variable ave
; The average is calculated by adding the four grades together and dividing by 4
; The average is printed to the screen using the printf function

    section .data
    a       dq      0x64
    b       dq      0x2D
    c       dq      70
    d       dq      85
    total   dq      0x4
    format  db      "The average is %d.",0
    ave     dq      0


    section .text
    global main
    extern printf

main:
    push    rbp 
    mov     rax, [a]                ; decimal value: 100
    add     rax, [b]                ; add 45 to value stored in rax
    add     rax, [c]                ; add 70 to value stored in rax
    add     rax, [d]                ; add 85 to value stored in rax
    mov     rdx, 0
    idiv    qword[total]            ; divide (rdx:rax) by 4 to get the grade average

    mov     qword[ave], rax         ; store the average in the variable ave

    lea     rdi, [format]           ; load the address of the string s into rdi
    mov     rsi, [ave]              ; load the average into rsi
    call    printf                  ; print the average

    xor     rax,rax      
    pop     rbp 
    ret


