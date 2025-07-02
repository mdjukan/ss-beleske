.intel_syntax noprefix

.global getX

.section .data
.skip 0x200
X: .quad 0

.section .text
getX:
    mov rax, X
    ret
