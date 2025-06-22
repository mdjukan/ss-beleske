.global foo

.section xyz
.skip 10, 0xff
foo: .byte 'a', 'b', 'c'
