.data
.text
.globl main
main:
	li	$v0,5
	syscall
	move	$t1,$v0		#t1=n
	sll	$t2,$t1,1	#t2=2*n
	add	$t2,$t2,1	#t2=2*n+1
	add	$t0,$0,1	#i=1
	add	$s0,$0,$0	#s0=sum=0
for:	add	$s0,$s0,$t0	#cong i vao tong
	beq	$t0,$t2,exit	#neu i=2n thi thoat
	add	$t0,$t0,2	#tang i len 2
	j	for		#quay ve vong lap
exit:	li	$v0,1		#in gia tri 
	move	$a0,$s0		#in ra sum
	syscall
	li	$v0,10		#thoat
	syscall