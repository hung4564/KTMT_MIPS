.data
	mang:	.word	10:10
	a:	.asciiz	"tong:"
.text
.globl main
main:	
	la	$s3,mang		#dia chi mang
	add 	$s4, $0,0		#sum=0
	add 	$s1, $0,0		#i=0
	add	$s2, $0,10		#n=5
Loop: 
	beq	$s1,$s2,Exit		#i=n thi thoat
	li	$v0,5			#nhan gia tri
	syscall
	sll 	$t0, $s1, 2 		# $t0 = 4*i
	add 	$t0, $t0, $s3 		# $t0 = ð?a ch? A[i]
	sw	$v0, 0($t0)		#luu gia tri vao A[i]
	add	$s1,$s1,1		#i=i+1
	j 	Loop 			# quay l?i Loop
Exit: 
	add 	$s1, $0,0		#i=0
looptong:
	beq	$s1,$s2,thoat
	sll 	$t0, $s1, 2 		# $t0 = 4*i
	add 	$t0, $t0, $s3 		# $t0 = ð?a ch? A[i]
	lw	$t1, 0($t0)		#lay gia tri vao A[i] vao $t1
	add	$s4,$s4,$t1		#sum=sum+a[i]
	add	$s1,$s1,1		#i=i+1
	j	looptong
thoat:
	li	$v0,1
	move	$a0,$s4
	syscall	
	li 	$v0, 10
	syscall