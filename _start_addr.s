.intel_syntax noprefix
.global _start

_start:
    mov rax
    mov rax, offset _start
    ret
