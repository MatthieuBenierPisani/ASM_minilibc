BITS 64
SECTION .text
GLOBAL strpbrk

strpbrk:
    xor rax, rax
    cmp rdi, 0 ;check si str1 pas vide
    je bad_return
    cmp rsi, 0 ;check si str2 pas vide
    je bad_return
    xor rcx, rcx ;déclare un compteur à 0

loop:
    xor r11, r11 ;déclare un compteur à 0
    cmp BYTE[rdi + rcx], 0 ;check si str1 pas à la fin
    je bad_return
    cmp BYTE[rsi + r11], 0 ;check si str2 pas à la fin
    je bad_return
    mov r8b, [rdi + rcx] ;remplit r8b par le char à l'adresse rdi + rcx
    mov r9b, [rsi + r11] ;remplit r9b par le char à l'adresse rsi + r11
    cmp r8b, 0 ;check si arrivé à '\0'
    je end
    cmp r9b, 0 ;check si arrivé à '\0'
    je end

find_in_arg:
    cmp BYTE[rsi + r11], 0 ;check si == à '\0'
    je inc_first_arg
    cmp r8b, BYTE[rsi + r11] ;check si occurence trouvée
    je end
    inc r11 ;incrémente l'index dans str2
    jmp find_in_arg

inc_first_arg:
    inc rdi ;incrémentation dans str1
    jmp loop

bad_return:
    mov rax, 0 ;valeur de return == 0
    ret

end:
    mov rax, rdi ;valeur de return == à l'adresse du premier char trouvé
    ret