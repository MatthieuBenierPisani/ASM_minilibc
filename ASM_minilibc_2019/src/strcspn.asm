BITS 64
SECTION .text
GLOBAL strcspn

strcspn:
    xor rcx, rcx

loop:
    movzx r8d, BYTE[rdi + rcx]
    cmp r8d, 0
    je end
    xor rdx, rdx

find_occu:
    movzx r10d, BYTE[rsi + rdx]
    cmp r10d, 0
    je return_main
    cmp r8, r10
    je end
    inc rdx
    jmp find_occu

return_main:
    inc rcx
    jmp loop

end:
    mov rax, rcx
    ret