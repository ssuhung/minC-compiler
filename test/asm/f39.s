# assembly generated by minc compiler ...
	.globl	f
    .type	f, @function
f:
    .cfi_startproc
    pushq	%rbp
    movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp
	subq	$8, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	pushq	$2
	popq	%rax
	popq	%rcx
	addq	%rax, %rcx
	pushq	%rcx
	popq	%rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rax
	movq	-16(%rbp), %rax
	pushq	%rax
	popq	%rax
	popq	%rcx
	imulq	%rcx
	pushq	%rax
	popq	%rax
	leave
	ret
	.cfi_endproc
