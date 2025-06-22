.intel_syntax noprefix

.section .data
x: .quad 1

.global foo
.section .text
foo:
    mov rax, x
    ret
