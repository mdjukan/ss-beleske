	.file	"buffer-overflow-basic.c"
	.intel_syntax noprefix
	.text
	.globl	memcopy
	.type	memcopy, @function
memcopy:
.LFB0:
	.cfi_startproc
	mov	eax, 0
	jmp	.L2
.L3:
	movsx	rcx, eax
	movzx	r8d, BYTE PTR [rdi+rcx]
	mov	BYTE PTR [rsi+rcx], r8b
	add	eax, 1
.L2:
	cmp	eax, edx
	jl	.L3
	ret
	.cfi_endproc
.LFE0:
	.size	memcopy, .-memcopy
	.globl	foo
	.type	foo, @function
foo:
.LFB1:
	.cfi_startproc
	sub	rsp, 16
	.cfi_def_cfa_offset 24
	mov	eax, 0
	jmp	.L5
.L6:
	movsx	rdx, eax
	mov	BYTE PTR 1[rsp+rdx], -1
	add	eax, 1
.L5:
	cmp	eax, 9
	jle	.L6
	lea	rsi, 11[rsp]
	lea	rdi, 1[rsp]
	mov	edx, 10
	call	memcopy
	add	rsp, 16
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	foo, .-foo
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	mov	eax, 0
	call	foo
	mov	eax, 0
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
