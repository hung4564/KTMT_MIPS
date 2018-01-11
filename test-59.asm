.data
	n:	.word	0
	m:	.word	0
	nm:	.word	0
	mn:	.word	0
	tb1:	.asciiz	"max la "
.text
.globl main
main:
	li	$v0,5
	syscall
	sw	$v0,n
	li	$v0,5
	syscall
	sw	$v0,m
	lw	$t1,n
	lw	$t2,m
	jal 	luythua
	sw	$t3,nm
	lw	$t1,m
	lw	$t2,n
	jal 	luythua
	sw	$t3,mn
	lw	$t1,nm
	lw	$t2,mn
	slt	$t3,$t1,$t2
	li	$v0,4
	la	$a0,tb1
	syscall	
	blez	$t3,max
	li	$v0,1
	move	$a0,$t2
	syscall
	j	thoat
max:	li	$v0,1
	move	$a0,$t1
	syscall
thoat:	li	$v0,10
	syscall
luythua:
	add	$t0,$0,1
	add	$t3,$t1,$0
for:	beq	$t0,$t2,exit
	add	$t0,$t0,1
	mult 	$t3,$t1
	mflo	$t3
	j	for
exit:		
	jr 	$ra
	
	