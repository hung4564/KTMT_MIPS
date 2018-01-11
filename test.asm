.data

.text
.globl main
main:	
	li	$s0,9
	li	$s1,0
	mult	$s0,$s0
	mflo	$t0
	li	$t3,3
	mult	$t0,$t3
	mflo	$t0
	li	$t3,5
	mult	$s0,$t3
	mflo	$t1
	add	$t2,$t0,$t1
	add	$s1,$t2,-18