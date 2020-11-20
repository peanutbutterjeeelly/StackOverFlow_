	.file	"stack.c"
	.text
	.globl	bof
	.type	bof, @function
bof:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	8(%ebp), %eax
	movl	%eax, -44(%ebp)
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	subl	$8, %esp
	pushl	-44(%ebp)
	leal	-36(%ebp), %eax
	pushl	%eax
	call	strcpy
	addl	$16, %esp
	movl	$1, %eax
	movl	-12(%ebp), %edx
	xorl	%gs:20, %edx
	je	.L3
	call	__stack_chk_fail
.L3:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	bof, .-bof
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"badfile"
.LC2:
	.string	"Returned Properly"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$548, %esp
	movl	%ecx, %eax
	movl	4(%eax), %eax
	movl	%eax, -540(%ebp)
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	subl	$8, %esp
	pushl	$.LC0
	pushl	$.LC1
	call	fopen
	addl	$16, %esp
	movl	%eax, -536(%ebp)
	pushl	-536(%ebp)
	pushl	$517
	pushl	$1
	leal	-529(%ebp), %eax
	pushl	%eax
	call	fread
	addl	$16, %esp
	subl	$12, %esp
	leal	-529(%ebp), %eax
	pushl	%eax
	call	bof
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC2
	call	puts
	addl	$16, %esp
	movl	$1, %eax
	movl	-12(%ebp), %edx
	xorl	%gs:20, %edx
	je	.L6
	call	__stack_chk_fail
.L6:
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
