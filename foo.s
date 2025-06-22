.intel_syntax noprefix

.section .data
.align 8
x: .quad 1

.global foo
.section .text
foo:
    mov rax, x
    mov rax, OFFSET x
    ret
