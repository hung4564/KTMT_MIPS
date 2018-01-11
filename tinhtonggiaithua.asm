.data
	tb2:	.asciiz "Tong bang: "
.text
.globl main
main:
	li	$v0,5
	syscall
	move	$t0,$v0		#$t0 la gia tri n
	li	$t1,0		#khoi tao gia tri 0 cho tong
	jal	for

ext:	
	li	$v0,4
	la	$a0,tb2
	syscall
	li	$v0,1
	move	$a0,$t1
	syscall
	li	$v0,10
	syscall
for:	
	beq	$t0,$0,ext	#dieu kien thoat vong lap n=0
	move	$t2,$t0		#gan gia tri cua n cho $t2
#	move	$t3,$0		#khoi toa gia tri 0 cho $t3
#	add	$t3,$t3,1	#khoi tao gia tri 1 cho giai thua
	li	$t3,1
forgiaithua:
	beq	$t2,$0,cong	#neu gia thi = 0 thi cong vao tong
	mul	$t3,$t3,$t2	#nhan giai thua
	sub	$t2,$t2,1	#giam gia tri cua $t2
	j	forgiaithua	#quay lai vong lap
cong:	add	$t1,$t1,$t3	#cong vao gia tri cua giai thua
	sub	$t0,$t0,1	#giam gia tri cua n
	j	for		#quay lai vong lap