.data	
	x:	.word	10
	y:	.word	12
.text
.globl main
main:
	#nap dia chi cua x y vao thanh ghi Sa0,$a1
	la	$a0,x
	la	$a1,y
	#nhay den ham swap, luu dia chi tro ve vao thanh ghi $ra
	jal	swap
	#ket thuc chuong trinh
	li	$v0,10
	syscall
swap:	
	lw	$t0,($a0)
	lw	$t1,($a1)
	sw	$t0,($a1)
	sw	$t1,($a0)
	jr	$ra