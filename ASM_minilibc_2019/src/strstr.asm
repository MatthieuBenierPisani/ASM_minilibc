BITS 64
SECTION .text
GLOBAL strstr

strstr:
    cmp rdi, 0
    je bad_return
    cmp rsi, 0
    je bad_return
    jmp main_loop

main_loop:
    xor rcx, rcx
    jmp loop

loop:
    mov r8b, [rsi + rcx]
    mov r9b, [rdi + rcx]
    cmp r8b, 0
    je end
    cmp r9b, r8b
    jne check_first_arg
    inc rcx
    jmp loop

check_first_arg:
    cmp r9b, 0
    je bad_return
    inc rdi
    jmp main_loop

bad_return:
    mov rax, 0
    ret

end:
    mov rax, rdi
    ret