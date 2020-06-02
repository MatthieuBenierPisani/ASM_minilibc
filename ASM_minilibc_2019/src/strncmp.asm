BITS 64
SECTION .text
GLOBAL strncmp

strncmp:
    xor rcx, rcx

loop:
    mov r8b, BYTE[rdi]
    mov r9b, BYTE[rsi]

    cmp r8b, r9b
    jne return
    cmp r8b, 0
    je return
    cmp r9b, 0
    je return

    inc rcx
    inc rsi
    inc rdi
    cmp rdx, rcx
    jle return

    jmp loop

return:
    movzx rax, r8b
    movzx rbx, r9b
    sub rax, rbx
    ret