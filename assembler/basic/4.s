.intel_syntax noprefix

.section .data
var: .quad 0

.global foo
.section .text
    mov rax, var
    mov rax, offset var
    mov rax, offset var[rip]
    mov rax, var[rip]

