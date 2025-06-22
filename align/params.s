foo:
	movsx	rdi, dil
	lea	rax, [rdi+rsi]
	ret
bar:
	movsx	rax, BYTE PTR 8[rsp]
	add	rax, QWORD PTR 9[rsp]
	ret
main:
	push	rbx
	sub	rsp, 16
	mov	BYTE PTR 7[rsp], 98
	mov	QWORD PTR 8[rsp], 1
	mov	edi, 97
	mov	esi, 1
	call	foo
	mov	rbx, rax
	sub	rsp, 16
	mov	rax, QWORD PTR 23[rsp]
	mov	QWORD PTR [rsp], rax
	movzx	eax, BYTE PTR 31[rsp]
	mov	BYTE PTR 8[rsp], al
	call	bar
	add	eax, ebx
	add	rsp, 32
	pop	rbx
	ret
