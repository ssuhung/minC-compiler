# assembly generated by minc compiler ...
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
	subq	$0, %rsp
	movq	56(%rbp), %rax
	pushq	%rax
	popq	%rax
	leave
	ret
	.cfi_endproc
