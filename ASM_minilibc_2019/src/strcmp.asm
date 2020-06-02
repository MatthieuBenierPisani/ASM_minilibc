BITS 64
SECTION .text
GLOBAL strcmp

strcmp:

loop:
    mov r8b, BYTE[rdi]
    mov r9b, BYTE[rsi]
    cmp r8b, 0
    je return
    cmp r9b, 0
    je return
    cmp r8b, r9b
    jne return
    inc rsi
    inc rdi
    jmp loop

return:
    movzx rax, r8b
    movzx rbx, r9b
    sub rax, rbx
    ret
