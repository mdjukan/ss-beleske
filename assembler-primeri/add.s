.intel_syntax noprefix

.global X, getX

.section .data
X: .quad 0

.section .text
getX:
    mov rax, OFFSET X[rip]
    ret
