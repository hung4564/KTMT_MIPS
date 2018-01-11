.data
	mang:	.space	40
	str1:	.asciiz	"Tong="
.text
.globl main
main:
	la	$s3,mang	#$s3 la dia chi co so cua mang
	addi	$s1,$0,0	#$s1=sum=0
	addi	$s2,$0,0	#$s2=i=0
	addi	$t0,$0,10	#$t0 la do dai mang
for:	beq	$s2,$t0,ext	#neu i=$t0 thi thoat
	sll	$t1,$s2,2	#$t1=4*i,d?ch ð?a ch? týõng ?ng v?i 1 word
	add	$t1,$t1,$s3	#$t1= dia chi cua a[i]
	lw	$t2,($t1)	#lay gia tri cua a[i] vao thanh ghi
	add	$s1,$s1,$t2	#sum=sum+a[i]
	addi	$s2,$s2,1	#i=i+1
	j	for		#quay lai vong lap
ext:	li	$v0,4
	la	$a0,str1
	syscall
	li	$v0,1
	move	$a0,$s1
	syscall
	li	$v0,10
	syscall