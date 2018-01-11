.data
	mang:	.word	0:20
.text
#t0=n
#t4=n-1
#t1=dia chi a[i]
#t2=dia chi a[j]
#s0=dia chi mang
#s1=i
#s2=j
#s3=a[i]
#s4=a[j]
#s5=gia tri so sanh
main:
	li	$v0,5
	syscall
	move	$t0,$v0			#t1=n
	sub	$t4,$t0,1
	move	$s1,$0			#s1=i=0
	la	$s0,mang		#$s0 giu dia chi mang
nhap:	beq	$s1,$t0,nhapxong	#i=n thi thoat
	li	$v0,5			#nhan gia tri
	syscall
	sll 	$t1, $s1, 2 		# $t1 = 4*i
	add 	$t1, $t1, $s0 		# $t1 = ð?a ch? A[i]
	sw	$v0, 0($t1)		#luu gia tri vao A[i]
	add	$s1,$s1,1		#i=i+1
	j	nhap
nhapxong:
	move	$s1,$0			#s1=i=0
sapxepvongi:
	beq	$s1,$t0,xongvongi	#i=n thi thoat
	sll 	$t1, $s1, 2 		# $t1 = 4*i
	add 	$t1, $t1, $s0 		# $t1 = ð?a ch? A[i]
	lw	$s3, 0($t1)		#lay gia tri cua A[i]
	move	$s2,$s1			#s2=j=i
sapxepvongj:
	beq	$s2,$t0,xongvongj	#j=n thi thoat
	sll 	$t2, $s2, 2 		# $t2 = 4*j
	add 	$t2, $t2, $s0 		# $t2 = ð?a ch? A[j]
	lw	$s4, 0($t2)		#lay gia tri cua A[j]
	slt 	$s5,$s3,$s4		#so sanh 2 gia tri 
	beq	$s5,$0,sapxep		#neu A[j]<A[i] thi doi cho
	j	xongsapxep
sapxep:	
	sw	$s4, 0($t1)		#luu gia tri vao A[i]
	sw	$s3, 0($t2)		#luu gia tri vao A[j]
xongsapxep:	
	add	$s2,$s2,1		#j=j+1
	j	sapxepvongj	
xongvongj:
	add	$s1,$s1,1		#i=i+1
	j	sapxepvongi	
xongvongi:									
	li	$v0,10
	syscall
	
