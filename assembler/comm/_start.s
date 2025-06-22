.intel_syntax noprefix
.global _start
.global x

.comm x, 8, 8

.section .text
_start:
    mov rax, x
    mov rdi, (rax)
    mov rax, 60
    syscall
