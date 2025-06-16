.intel_syntax noprefix

.section .data
x: .quad 60

.section .text
_start:
    xor rdi, rdi
    mov rax, offset x
    syscall
