foo:
        push    rbx
        sub     rsp, 32
        mov     rbx, rdi
        cmp     esi, 1
        jle     .L3
        mov     rdi, rsp
        sub     esi, 1
        call    foo
        mov     rax, QWORD PTR [rsp]
        lea     rcx, [rax+1]
        mov     rax, QWORD PTR [rsp+8]
        lea     rdx, [rax+2]
        mov     rax, QWORD PTR [rsp+16]
        add     rax, 3
.L2:
        mov     QWORD PTR [rbx], rcx
        mov     QWORD PTR [rbx+8], rdx
        mov     QWORD PTR [rbx+16], rax
        mov     rax, rbx
        add     rsp, 32
        pop     rbx
        ret
.L3:
        mov     ecx, 1
        mov     edx, 1
        mov     eax, 1
        jmp     .L2
