.intel_syntax noprefix

.section .data
X: .quad 1

.global foo
.section .text
foo:
    mov rax, OFFSET X[rip]
.end
    mov rax, OFFSET X[rip]
