BITS 64
SECTION .text
GLOBAL memcpy

memcpy:
    xor rcx, rcx

loop:
    cmp rdx, rcx
    je return

    mov r8b, [rsi + rcx]
    mov [rdi + rcx], r8b

    inc rcx
    jmp loop

return:
    mov rax, rdi
    ret