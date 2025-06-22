	.file	"struct.c"
	.intel_syntax noprefix
	.text
	.globl	foo
	.type	foo, @function
foo:
	mov	rax, rdi
	mov	BYTE PTR [rdi], 97
	mov	DWORD PTR 1[rdi], 1
	mov	BYTE PTR 5[rdi], 98
	ret

	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"[struct A]"
.LC1:
	.string	"sizeof(struct A)=%zu\n"
.LC2:
	.string	"alignof(struct A)=%zu\n"
.LC3:
	.string	"offset(struct A, x)=%zu\n"
.LC4:
	.string	"offset(struct A, y)=%zu\n"
.LC5:
	.string	"offset(struct A, z)=%zu\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	lea	rdi, .LC0[rip]
	call	puts@PLT
	mov	edx, 6
	lea	rsi, .LC1[rip]
	mov	edi, 2
	mov	eax, 0
	call	__printf_chk@PLT
	mov	edx, 1
	lea	rsi, .LC2[rip]
	mov	edi, 2
	mov	eax, 0
	call	__printf_chk@PLT
	mov	edx, 0
	lea	rsi, .LC3[rip]
	mov	edi, 2
	mov	eax, 0
	call	__printf_chk@PLT
	mov	edx, 1
	lea	rsi, .LC4[rip]
	mov	edi, 2
	mov	eax, 0
	call	__printf_chk@PLT
	mov	edx, 5
	lea	rsi, .LC5[rip]
	mov	edi, 2
	mov	eax, 0
	call	__printf_chk@PLT
	mov	eax, 0
	add	rsp, 8
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
