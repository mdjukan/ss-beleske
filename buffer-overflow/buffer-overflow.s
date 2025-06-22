	.file	"buffer-overflow.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"***worm***"
	.text
	.globl	worm
	.type	worm, @function
worm:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	edi, 1
	call	exit@PLT
	.cfi_endproc
.LFE6:
	.size	worm, .-worm
	.globl	fill_buffer
	.type	fill_buffer, @function
fill_buffer:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	DWORD PTR -36[rbp], edx
	mov	DWORD PTR -4[rbp], 0
	jmp	.L3
.L4:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -4[rbp]
	movsx	rcx, edx
	mov	rdx, QWORD PTR -24[rbp]
	add	rdx, rcx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR [rdx], al
	add	DWORD PTR -4[rbp], 1
.L3:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -36[rbp]
	jl	.L4
	nop
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	fill_buffer, .-fill_buffer
	.globl	foo
	.type	foo, @function
foo:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80

	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax

	xor	eax, eax
	mov	edi, 80
	call	malloc@PLT
	mov	QWORD PTR -56[rbp], rax
	lea	rax, worm[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	DWORD PTR -76[rbp], 0
	jmp	.L6
.L7:
	mov	rax, QWORD PTR -64[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR -76[rbp]
	cdqe
	mov	BYTE PTR -40[rbp+rax], dl
	shr	QWORD PTR -64[rbp], 8
	add	DWORD PTR -76[rbp], 1
.L6:
	cmp	DWORD PTR -76[rbp], 7
	jle	.L7
	mov	rax, QWORD PTR -56[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	DWORD PTR -72[rbp], 0
	jmp	.L8
.L11:
	mov	DWORD PTR -68[rbp], 0
	jmp	.L9
.L10:
	mov	eax, DWORD PTR -72[rbp]
	lea	edx, 0[0+rax*8]
	mov	eax, DWORD PTR -68[rbp]
	add	eax, edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -48[rbp]
	add	rdx, rax
	mov	eax, DWORD PTR -68[rbp]
	cdqe
	movzx	eax, BYTE PTR -40[rbp+rax]
	mov	BYTE PTR [rdx], al
	add	DWORD PTR -68[rbp], 1
.L9:
	cmp	DWORD PTR -68[rbp], 7
	jle	.L10
	add	DWORD PTR -72[rbp], 1
.L8:
	cmp	DWORD PTR -72[rbp], 9
	jle	.L11
	mov	rcx, QWORD PTR -56[rbp]
	lea	rax, -32[rbp]
	mov	edx, 80
	mov	rsi, rcx
	mov	rdi, rax
	call	fill_buffer
	nop
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	foo, .-foo
	.section	.rodata
.LC1:
	.string	"***returned from foo***"
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	eax, 0
	call	foo
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
