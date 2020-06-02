BITS 64
SECTION .text
GLOBAL strcasecmp

strcasecmp:
    xor rcx, rcx

init_var:
    mov r8b, [rdi + rcx]
    mov r9b, [rsi + rcx]

loop:
    cmp r8b, 0
    je return
    cmp r9b, 0
    je return
    cmp r8b, 90
    jle first_to_low

second_loop:
    cmp r9b, 90
    jle second_to_low

third_loop:
    cmp r8b, r9b
    jne return
    inc rcx
    jmp init_var

first_to_low:
    cmp r8b, 65
    jge first_to_low2
    jmp second_loop

first_to_low2:
    add r8b, 32
    jmp loop

second_to_low:
    cmp r9b, 65
    jge second_to_low2
    jmp third_loop

second_to_low2:
    add r9b, 32
    jmp loop

return:
    movzx rax, r8b
    movzx rbx, r9b
    sub rax, rbx
    ret