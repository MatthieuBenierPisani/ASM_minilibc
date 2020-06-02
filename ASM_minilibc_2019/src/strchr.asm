BITS 64
SECTION .text
GLOBAL strchr

strchr:
    xor rax, rax

loop:
    cmp BYTE[rdi], 0
    je occurence_not_found

    cmp BYTE[rdi], sil
    je occurence_found

    inc rdi
	jmp loop

occurence_not_found:
    mov rax, 0
    jmp return

occurence_found:
	mov rax, rdi
    jmp return

return:
    ret