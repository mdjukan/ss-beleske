.intel_syntax noprefix
.global hello_world

.section .data
message: .ascii "Hello World!\n"
.equ message_len, . - message

.section .text
hello_world:
    mov rax, 1
    mov rdi, 1
    mov rsi, OFFSET message
    mov rdx, OFFSET message_len
    syscall
    ret

