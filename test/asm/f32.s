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
	subq	$24, %rsp
	subq	$0, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	popq	%rax
	popq	%rcx
	subq	%rax, %rcx
	pushq	%rcx
	movq	-24(%rbp), %rax
	pushq	%rax
	popq	%rax
	popq	%rcx
	subq	%rax, %rcx
	pushq	%rcx
	popq	%rax
	leave
	ret
	.cfi_endproc
