.intel_syntax noprefix

.extern foo
.section .text
bar:
    call foo
