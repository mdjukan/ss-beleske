.intel_syntax noprefix

.section s1
x: .byte 1
x_addr_s1: .long offset x

.section s2
x_addr_s2: .long x
