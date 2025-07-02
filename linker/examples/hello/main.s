.intel_syntax noprefix
.global _start
.extern hello_world

.section .text
_start:
    call hello_world
    mov rax, 60
    mov rdi, 0
    syscall
