.extern y, bar
.global x, foo

.section .X
x: .long y

.section .text
foo:
    call bar
