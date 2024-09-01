BITS 64

%ifndef CONSTANTS
%define CONSTANTS

section .data

    ; System calls

    sys_read equ 0
    sys_write equ 1
    sys_exit equ 60

    ; File descriptors

    stdin equ 0
    stdout equ 1

    ; Messages

    message db "The message content", 0
    message_length equ $ - message

    success_message db "The character was found", 10
    success_message_length equ $ - success_message

    failure_message db "The character was not found", 10
    failure_message_length equ $ - failure_message

section .bss

    user_input resb 20

%endif

