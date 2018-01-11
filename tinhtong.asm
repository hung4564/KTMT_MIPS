.data
	tb1:	.asciiz "Nhap n:"
	tb2:	.asciiz "Tong bang: "
.text
.globl main
main:
	li	$v0,4
	la	$a0,tb1
	syscall
	li	$v0,5
	syscall
	move	$t0,$v0		#$t0 la gia tri n
	move	$t1,$0		
for:	beq	$t0,$0,ext	#dieu kien thoat vong lap n=0
	add	$t1,$t1,$t0	#cong vao gia tri cua n
	sub	$t0,$t0,1	#giam gia tri cua n
	j	for		#quay lai vong lap
ext:	li	$v0,4
	la	$a0,tb2
	syscall
	li	$v0,1
	move	$a0,$t1
	syscall
	li	$v0,10
	syscall
