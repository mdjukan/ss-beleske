.intel_syntax noprefix

.global a, b, c

.section .data
a: .byte 'a'
.skip 100
b: .byte 'b'
.align 256
c: .byte 'c'
