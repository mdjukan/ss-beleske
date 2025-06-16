.intel_syntax noprefix

.global a

.section .data
a: .quad 1
b: .quad 2

.section .text
    mov QWORD PTR offset a[rip], 0xAABB
    mov QWORD PTR offset b[rip], 0xFFEE
