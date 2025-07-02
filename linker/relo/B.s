.intel_syntax noprefix

.extern x
.global y, bar

.equ y, 0

.section SEC2
.quad 0

.section .text
bar:
    mov rax, OFFSET x
