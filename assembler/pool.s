.section .text
.global symConst
.set symConst, 0x11223344
ldr r1, =symConst
ldr r2, =0x55667788
.set symConst, 0x55667788
ldr r3, =symConst
.end
