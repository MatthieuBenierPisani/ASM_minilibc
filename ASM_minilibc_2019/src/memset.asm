BITS 64
SECTION .text
GLOBAL memset

memset:
	xor rcx, rcx
    mov rax, rdi

loop:
    cmp rcx, rdx
    je return

    mov BYTE[rax + rcx], sil
    inc rcx
    jmp loop

return:
	ret