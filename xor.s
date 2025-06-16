.intel_syntax noprefix
.global xor
.type xor, @function

.section .text
xor:
    movabs rax, 0xFFFFFFFFFFFFFFFF
    xor al, al
    movabs rax, 0xFFFFFFFFFFFFFFFF
    xor ax, ax
    movabs rax, 0xFFFFFFFFFFFFFFFF
    xor eax, eax
    movabs rax, 0xFFFFFFFFFFFFFFFF
    xor rax, rax
    ret
