.intel_syntax noprefix

.extern y
.global x, foo

.section SEC1
x: .quad 0

.section .text
foo:
    mov rax, OFFSET y
