.data
	n:	.word	0
	m:	.word	0
	luythua:.word	1
.text
.globl main
main:
	li	$v0,5
	syscall
	sw	$v0,n
	li	$v0,5
	syscall
	sw	$v0,m
	move	$a0,$v0
	jal	pow
	li	$v0,1
	lw	$a0,luythua
	syscall
	li	$v0,10
	syscall
pow:
	addi	$sp,$sp,-8
	sw	$ra,4($sp)	#luu du lieu cua con tro ra de quay ve
	sw	$a0,0($sp)	#luu du lieu cua m hien gio
	#if(n==1) return a
	slti	$t0,$a0,2	#m>2?
	beq	$t0,$0,L1	#neu m>2 nhay den L1
	lw	$v0,n		#m=1 thi tra ve n
	addi	$sp,$sp,8	
	jr	$ra		
L1:	
	addi	$a0,$a0,-1
	
	
	jal	pow	
	lw	$a0,4($sp)	#luu du lieu m hien gio
	lw	$s0,n
	mult	$v0,$s0
	mflo	$v0
	lw	$a0,0($sp)	#tra ve gia tri n nguyen ban
	lw	$ra,4($sp)	#tra ve con tro toi ham main
	sw	$v0,luythua
	addi	$sp,$sp,8	#tra lai bo nho
	jr	$ra		#nhay toi ham main
	
	
