.intel_syntax noprefix
.global shift
.type shift, @function

.section .text
shift:
    movabs rax, 0x8000000000000001
    sal rax, 1
    setb al 

    movabs rax, 0x8000000000000001
    sal rax, 2
    setb al

    movabs rax, 0x8000000000000001
    sar rax, 1
    setb al

    movabs rax, 0x8000000000000001
    sar rax, 2
    setb al

    ret
