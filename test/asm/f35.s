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
	popq	%rcx
	popq	%rax
	cmpq	%rax, %rcx
	movq	$0, %rax
	sete	%al
	pushq	%rax
	movq	-24(%rbp), %rax
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
