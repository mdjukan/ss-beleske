.intel_syntax noprefix
.global x
.global mov
.type mov, @function

.section .data
x: .quad 0

.section .text
mov:
    movabs rax, 0xFFFFFFFFFFFFFFFF
    mov OFFSET x[rip], rax

    movabs rax, 0xFFFFFFFFFFFFFFFF
    mov al, 0x0
    movabs rax, 0xFFFFFFFFFFFFFFFF
    mov ax, 0x0
    movabs rax, 0xFFFFFFFFFFFFFFFF
    mov eax, 0x0
    movabs rax, 0xFFFFFFFFFFFFFFFF
    mov rax, 0x0
    ret
