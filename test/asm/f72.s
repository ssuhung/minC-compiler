# assembly generated by minc compiler ...
	.globl	f37
    .type	f37, @function
f37:
    .cfi_startproc
    pushq	%rbp
    movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	%r9, -48(%rbp)
	subq	$48, %rsp
	subq	$0, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-24(%rbp), %rax
	pushq	%rax
	popq	%rax
	popq	%rcx
	imulq	%rcx
	pushq	%rax
	popq	%rax
	popq	%rcx
	addq	%rax, %rcx
	pushq	%rcx
	movq	-32(%rbp), %rax
	pushq	%rax
	movq	-40(%rbp), %rax
	pushq	%rax
	movq	-48(%rbp), %rax
	pushq	%rax
	popq	%rax
	popq	%rcx
	imulq	%rcx
	pushq	%rax
	popq	%rax
	popq	%rcx
	addq	%rax, %rcx
	pushq	%rcx
	movq	16(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	popq	%rax
	popq	%rcx
	imulq	%rcx
	pushq	%rax
	popq	%rax
	popq	%rcx
	addq	%rax, %rcx
	pushq	%rcx
	popq	%rax
	popq	%rcx
	cmpq	%rax, %rcx
	movq	$0, %rax
	setl	%al
	pushq	%rax
	popq	%rcx
	popq	%rax
	cmpq	%rax, %rcx
	movq	$0, %rax
	sete	%al
	pushq	%rax
	popq	%rax
	leave
	ret
	.cfi_endproc
	.globl	f
    .type	f, @function
f:
    .cfi_startproc
    pushq	%rbp
    movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	%r9, -48(%rbp)
	subq	$48, %rsp
	subq	$16, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	movq	16(%rbp), %rax
	pushq	%rax
	popq	%r9
	movq	-48(%rbp), %rax
	pushq	%rax
	popq	%r8
	movq	-40(%rbp), %rax
	pushq	%rax
	popq	%rcx
	movq	-32(%rbp), %rax
	pushq	%rax
	popq	%rdx
	movq	-24(%rbp), %rax
	pushq	%rax
	popq	%rsi
	movq	-16(%rbp), %rax
	pushq	%rax
	popq	%rdi
	call	f37
	pushq	%rax
	popq	%rax
	movq	%rax, -56(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	32(%rbp), %rax
	pushq	%rax
	movq	24(%rbp), %rax
	pushq	%rax
	popq	%r9
	movq	16(%rbp), %rax
	pushq	%rax
	popq	%r8
	movq	-48(%rbp), %rax
	pushq	%rax
	popq	%rcx
	movq	-40(%rbp), %rax
	pushq	%rax
	popq	%rdx
	movq	-32(%rbp), %rax
	pushq	%rax
	popq	%rsi
	movq	-24(%rbp), %rax
	pushq	%rax
	popq	%rdi
	call	f37
	pushq	%rax
	popq	%rax
	movq	%rax, -64(%rbp)
	movq	-56(%rbp), %rax
	pushq	%rax
	movq	-64(%rbp), %rax
	pushq	%rax
	popq	%rax
	popq	%rcx
	addq	%rax, %rcx
	pushq	%rcx
	popq	%rax
	leave
	ret
	.cfi_endproc
