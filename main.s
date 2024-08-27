	.file	"main.c"
	.text
	.p2align 4
	.globl	byteSwap32
	.type	byteSwap32, @function
byteSwap32:
.LFB11:
	.cfi_startproc
	movl	%edi, %eax
	bswap	%eax
	ret
	.cfi_endproc
.LFE11:
	.size	byteSwap32, .-byteSwap32
	.p2align 4
	.globl	getFloatFromTwo16Bit
	.type	getFloatFromTwo16Bit, @function
getFloatFromTwo16Bit:
.LFB12:
	.cfi_startproc
	sall	$16, %edi
	movzwl	%si, %esi
	orl	%esi, %edi
	bswap	%edi
	movd	%edi, %xmm0
	ret
	.cfi_endproc
.LFE12:
	.size	getFloatFromTwo16Bit, .-getFloatFromTwo16Bit
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"\320\227\320\260\321\200\321\217\320\264 \320\261\320\260\321\202\320\260\321\200\320\265\320\270: %.1f \320\222\n"
	.align 8
.LC1:
	.string	"\320\241\320\272\320\276\321\200\320\276\321\201\321\202\321\214 \320\262\320\270\320\261\321\200\320\260\321\206\320\270\320\270 \320\277\320\276 \320\276\321\201\320\270 X: %.1f\n"
	.align 8
.LC2:
	.string	"\320\241\320\272\320\276\321\200\320\276\321\201\321\202\321\214 \320\262\320\270\320\261\321\200\320\260\321\206\320\270\320\270 \320\277\320\276 \320\276\321\201\320\270 Y: %.1f\n"
	.align 8
.LC3:
	.string	"\320\241\320\272\320\276\321\200\320\276\321\201\321\202\321\214 \320\262\320\270\320\261\321\200\320\260\321\206\320\270\320\270 \320\277\320\276 \320\276\321\201\320\270 Z: %.1f\n"
	.align 8
.LC4:
	.string	"\320\242\320\265\320\272\321\203\321\211\320\260\321\217 \320\262\320\270\320\261\321\200\320\260\321\206\320\270\321\217 \320\277\320\276 \320\276\321\201\320\270 X: %.1f\n"
	.align 8
.LC5:
	.string	"\320\242\320\265\320\272\321\203\321\211\320\260\321\217 \320\262\320\270\320\261\321\200\320\260\321\206\320\270\321\217 \320\277\320\276 \320\276\321\201\320\270 Y: %.1f\n"
	.align 8
.LC6:
	.string	"\320\242\320\265\320\272\321\203\321\211\320\260\321\217 \320\262\320\270\320\261\321\200\320\260\321\206\320\270\321\217 \320\277\320\276 \320\276\321\201\320\270 Z: %.1f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB13:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movzwl	2+nap_bat(%rip), %esi
	movzwl	nap_bat(%rip), %edi
	movl	$1, %eax
	call	getFloatFromTwo16Bit
	leaq	.LC0(%rip), %rdi
	cvtss2sd	%xmm0, %xmm0
	call	printf@PLT
	movzwl	2+vibroScorost_X(%rip), %esi
	movzwl	vibroScorost_X(%rip), %edi
	movl	$1, %eax
	call	getFloatFromTwo16Bit
	leaq	.LC1(%rip), %rdi
	cvtss2sd	%xmm0, %xmm0
	call	printf@PLT
	movzwl	2+vibroScorost_Y(%rip), %esi
	movzwl	vibroScorost_Y(%rip), %edi
	movl	$1, %eax
	call	getFloatFromTwo16Bit
	leaq	.LC2(%rip), %rdi
	cvtss2sd	%xmm0, %xmm0
	call	printf@PLT
	movzwl	2+vibroScorost_Z(%rip), %esi
	movzwl	vibroScorost_Z(%rip), %edi
	movl	$1, %eax
	call	getFloatFromTwo16Bit
	leaq	.LC3(%rip), %rdi
	cvtss2sd	%xmm0, %xmm0
	call	printf@PLT
	movzwl	2+vibroPerem_X(%rip), %esi
	movzwl	vibroPerem_X(%rip), %edi
	movl	$1, %eax
	call	getFloatFromTwo16Bit
	leaq	.LC4(%rip), %rdi
	cvtss2sd	%xmm0, %xmm0
	call	printf@PLT
	movzwl	2+vibroPerem_Y(%rip), %esi
	movzwl	vibroPerem_Y(%rip), %edi
	movl	$1, %eax
	call	getFloatFromTwo16Bit
	leaq	.LC5(%rip), %rdi
	cvtss2sd	%xmm0, %xmm0
	call	printf@PLT
	movzwl	vibroPerem_Z(%rip), %edi
	movzwl	2+vibroPerem_Z(%rip), %esi
	movl	$1, %eax
	call	getFloatFromTwo16Bit
	leaq	.LC6(%rip), %rdi
	cvtss2sd	%xmm0, %xmm0
	call	printf@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE13:
	.size	main, .-main
	.globl	vibroPerem_Z
	.data
	.align 2
	.type	vibroPerem_Z, @object
	.size	vibroPerem_Z, 4
vibroPerem_Z:
	.value	25174
	.value	-6080
	.globl	vibroPerem_Y
	.align 2
	.type	vibroPerem_Y, @object
	.size	vibroPerem_Y, 4
vibroPerem_Y:
	.value	6449
	.value	17729
	.globl	vibroPerem_X
	.align 2
	.type	vibroPerem_X, @object
	.size	vibroPerem_X, 4
vibroPerem_X:
	.value	20164
	.value	-3520
	.globl	vibroScorost_Z
	.align 2
	.type	vibroScorost_Z, @object
	.size	vibroScorost_Z, 4
vibroScorost_Z:
	.value	832
	.value	3136
	.globl	vibroScorost_Y
	.align 2
	.type	vibroScorost_Y, @object
	.size	vibroScorost_Y, 4
vibroScorost_Y:
	.value	65
	.value	-2241
	.globl	vibroScorost_X
	.align 2
	.type	vibroScorost_X, @object
	.size	vibroScorost_X, 4
vibroScorost_X:
	.value	-20979
	.value	3648
	.globl	nap_bat
	.align 2
	.type	nap_bat, @object
	.size	nap_bat, 4
nap_bat:
	.value	248
	.value	26432
	.ident	"GCC: (GNU) 14.2.1 20240805"
	.section	.note.GNU-stack,"",@progbits
