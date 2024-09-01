BITS 64

%ifndef FUNCTIONS
%define FUNCTIONS

%include 'source/constants.asm'

section .text

print_message:
    push rax
    push rdi
    push rsi
    push rcx

    mov rdx, rdi
    mov rsi, rax
    mov rdi, stdout
    mov rax, sys_write
    syscall

    pop rax
    pop rdi
    pop rsi
    pop rcx

    ret

get_user_input:
    push rax
    push rdi
    push rsi
    push rcx

    mov rdx, rdi
    mov rsi, rax
    mov rdi, stdin
    mov rax, sys_read
    syscall

    pop rax
    pop rdi
    pop rsi
    pop rcx

    ret

find_char_index:
    mov rax, 0

    .search_loop:
        movzx r10, byte [rdi + rax]
        cmp r10, rsi
        je .found_exit
        cmp rax, rdx
        je .not_found_exit
        inc rax
        jne .search_loop

    .not_found_exit:
        mov rax, -1
        jmp .exit

    .found_exit:
        jmp .exit

    .exit:
        ret

exit:
    push rax
    push rdi
    push rsi
    push rcx

    mov rax, sys_exit
    xor rdi, rdi
    syscall

    pop rax
    pop rdi
    pop rsi
    pop rcx

    ret

%endif

