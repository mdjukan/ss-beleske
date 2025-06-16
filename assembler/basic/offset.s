.intel_syntax noprefix

.section .data
x: .quad 60

.global _start
.section .text
_start:
    mov rax, offset x
    mov rax, x
    mov rax, offset x[rip]
    mov rax, x[rip]

    xor rdi, rdi
    syscall
