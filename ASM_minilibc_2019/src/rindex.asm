BITS 64
SECTION .text
GLOBAL rindex

rindex:
    xor rcx, rcx
    xor rax, rax

inc_count:
    mov r8b, [rdi + rcx]
    cmp r8b, 0
    je found
    inc rcx
    jmp inc_count

found:
    mov r8b, [rdi + rcx]
    cmp rcx, -1
    je end_reached
    cmp r8b, sil
    je result
    dec rcx
    jmp found

end_reached:
    cmp sil, 0
    jne return_null
    jmp result

result:
    cmp rcx, 0
    je return
    inc rdi
    dec rcx
    jmp result

return_null:
    ret

return:
    mov rax, rdi
    ret