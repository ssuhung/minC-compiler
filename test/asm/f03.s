# assembly generated by minc compiler ...
	.globl	f
    .type	f, @function
f:
    .cfi_startproc
    pushq	%rbp
    movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	subq	$8, %rsp
	subq	$0, %rsp
	movq	-8(%rbp), %rax
	pushq	%rax
	popq	%rax
	leave
	ret
	.cfi_endproc
