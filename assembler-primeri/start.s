.intel_syntax noprefix
.global _start

.section .data
x: .quad 1

.section .text

_start:
    mov rax, x
