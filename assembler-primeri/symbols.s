.intel_syntax noprefix

.section X
.skip 0x10
x1: .byte 1
x2: .byte 2

.section Y
y: .byte 1


.equ z, x2-x1
.equ t, 7
