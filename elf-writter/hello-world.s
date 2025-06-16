.intel_syntax noprefix
.global _start

.section .text
_start:
        mov rdi, 1
        lea rsi, offset msg[rip]
        mov rdx, 13
        mov rax, 1
        syscall
        mov rax, 60 
        mov rdi, 0
        syscall
msg: .ascii "Hello World!\n"
