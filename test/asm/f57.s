# assembly generated by minc compiler ...
	.globl	f28
    .type	f28, @function
f28:
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
	movq	48(%rbp), %rax
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
	subq	$0, %rsp
	subq	$0, %rsp
	pushq	$1200
	pushq	$1100
	pushq	$1000
	pushq	$900
	pushq	$800
	pushq	$700
	pushq	$600
	popq	%r9
	pushq	$500
	popq	%r8
	pushq	$400
	popq	%rcx
	pushq	$300
	popq	%rdx
	pushq	$200
	popq	%rsi
	pushq	$100
	popq	%rdi
	call	f28
	pushq	%rax
	pushq	$10
	popq	%rax
	popq	%rcx
	addq	%rax, %rcx
	pushq	%rcx
	popq	%rax
	leave
	ret
	.cfi_endproc
