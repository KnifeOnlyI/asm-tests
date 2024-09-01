BITS 64

%ifndef MAIN
%define MAIN

%include 'source/constants.asm'
%include 'source/functions.asm'

section .text

global _start

_start:
    mov rdi, message        ; The message to search in
    mov rsi, 0            ; The character to search
    mov rdx, message_length ; The maximum number of characters to search
    call find_char_index

    cmp rax, -1
    je .failure
    jmp .success

    .success:
        push rax

        mov rax, success_message
        mov rdi, success_message_length
        call print_message

        pop rax

        mov rdi, rax
        mov rax, message
        call print_message

        jmp .exit

    .failure:
        mov rax, failure_message
        mov rdi, failure_message_length
        call print_message
        jmp .exit

    .exit:
        call exit

%endif

