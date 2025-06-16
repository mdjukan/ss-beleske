.intel_syntax noprefix

.section s1
a: .quad 1
b: .quad 2

.section s2
c: .quad 3
d: .quad 4

.equ e1, a-b
#.equ e2, a+b
.equ e3, c-d
.equ e4, a+2*(c-d)
