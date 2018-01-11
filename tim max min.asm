.data
	a:	.word	0
	b:	.word	0
	text3:	.asciiz	"max la:"
	text4:	.asciiz	"\nmin la:"
.text
.globl main
main:
	li	$v0,5
	syscall
	move	$t0,$v0		#$t0=a,coi max=a
	li	$v0,5
	syscall
	move	$t1,$v0		#$t1=b
	sw	$t0, a		#luu gia tri vao bien a
	sw	$t1, b		#luu gia tri vao bien b
	slt 	$t3,$t1,$t0	#t3=1 neu a>b, =0 neu a<b
	bgtz	$t3,kethuc	#neu a>b thi den in ra dap an
	move	$t4,$t0
	move	$t0,$t1
	move	$t1,$t4
kethuc:
	li	$v0,4
	la	$a0,text3
	syscall
	li	$v0,1
	move	$a0,$t0
	syscall
	li	$v0,4
	la	$a0,text4
	syscall
	li	$v0,1
	move	$a0,$t1
	syscall
	li	$v0,10
	syscall