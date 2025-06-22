.intel_syntax noprefix

.section .data
x: .quad 1

.global bar
.section .text
bar:
    mov rax, x
    ret
