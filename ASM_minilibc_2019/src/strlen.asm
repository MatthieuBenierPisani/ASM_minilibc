BITS 64
SECTION .text
GLOBAL strlen

strlen:
	xor rcx, rcx

loop:

	cmp BYTE[rdi + rcx], 0
	je return

	inc rcx
	jmp loop

return:

	mov rax, rcx
	ret