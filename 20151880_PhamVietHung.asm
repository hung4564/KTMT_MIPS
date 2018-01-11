.data
	mssv:	.asciiz	"\n20151880-PhamVietHung"
	intb:	.asciiz	"\nchon 1 hoac 2:"
	intb1:	.asciiz	"\nNhap so nguyen duong can kiem tra:"
	intb3:	.asciiz	"\nChi duoc chon 1 hoac 2\nMoi nhap lai"
	intb4:	.asciiz	"\nBan co muon lam lai(1 la co,0 la khong)"
	intb5:	.asciiz	"\nKet thuc chuong trinh"
	text1:	.asciiz	"So do co 1 chu so"
	text2:	.asciiz	"So do co 2 chu so"
	text3:	.asciiz	"So do co 3 chu so"
	text4:	.asciiz	"So do co nhieu hon 3 chu so"
	Message1:	.asciiz "Nhap A["
	Message2:	.asciiz	"]: "
	Message3:	.asciiz	"Phan tu lon nhat la:"
	mang:	.word	0:5
	
.text
.globl main
main:
	li	$v0,4		#in thong bao	
	la	$a0,mssv	
	syscall
chon:	li	$v0,4		#in thong bao	
	la	$a0,intb	
	syscall
	li	$v0,5		#nhan so chon
	syscall			
	move	$t0,$v0			
	beq	$t0,1,bai1	#nhay den bai1 neu bang 1
	beq	$t0,2,bai2	#nhay den bai2 neu bang 2
	li	$v0,4		#in ra thong bao khong thoa man
	la	$a0,intb3
	syscall
	j	chon		#quay lai muc chon
exit:	
	li	$v0,4		#in thong bao	
	la	$a0,intb4	
	syscall
	li	$v0,5		#nhan so chon
	syscall	
	bgtz	$v0,chon	#quay lai muc chon neu bang 1
	li	$v0,4		#in thong bao	
	la	$a0,intb5	
	syscall
	li	$v0,10		#ket thuc chuong trinh	
	syscall
bai1:	
	li	$v0,4		#in ra thong bao
	la	$a0,intb1
	syscall
	li	$v0,5		#nhan so can kiem tra
	syscall		
	move	$t1,$v0		
		
	sub	$t2,$t1,10	#- voi 10 neu nho thi la so 1 chu so
	bltz	$t2,tb1		#den muc in thong bao
	sub	$t2,$t1,100	#- voi 100 neu nho thi la so 2 chu so
	bltz	$t2,tb2		#den muc in thong bao
	sub	$t2,$t1,1000	#- voi 1000 neu nho thi la so 3 chu so
	bltz	$t2,tb3		#den muc in thong bao
	bgez	$t2,tb4		#neu khong thoa man 3 cai tren thi la so hon 3 chu so
	j	exit		#quay lai cai thoat
	
tb1:	li	$v0,4
	la	$a0,text1
	syscall
	j	exit
tb2:	li	$v0,4
	la	$a0,text2
	syscall
	j	exit
tb3:	li	$v0,4
	la	$a0,text3
	syscall
	j	exit
tb4:	li	$v0,4
	la	$a0,text4
	syscall
	j	exit

bai2:	
	add	$t2,$0,5		#n=5
	add	$s1,$0,0		#gan gia tri ban dau cua i
	la	$s0,mang		#$s0 giu dia chi mang
nhap:	beq	$s1,$t2,nhapxong	#i=n thi thoat

	li $v0, 4			#in ra thong bao "nhapA[i]
	la $a0, Message1
	syscall
	li $v0, 1
	move $a0, $s1
	syscall
	li $v0, 4
	la $a0, Message2
	syscall		
	li	$v0,5			#nhan gia tri
	syscall
	beq	$s1,$0,gangiatri	#neu la gia tri dau tien
	slt	$t3,$s2,$v0		#so sanh gia tri
	beq	$t3,$0,tiepnhap		#neu khong lon hon thi nhay tiepnhap
gangiatri:
	move	$s2,$v0			#neu nho hon thi gan gia tri
tiepnhap:
	sll 	$t1, $s1, 2 		# $t1 = 4*i
	add 	$t1, $t1, $s0 		# $t1 = ð?a ch? A[i]
	sw	$v0, 0($t1)		#luu gia tri vao A[i]
	add	$s1,$s1,1		#i=i+1
	j	nhap
nhapxong:
	li	$v0,4			#in ra thong bao
	la	$a0,Message3
	syscall
	li	$v0,1			#in ra gia tri so lon nhat
	move	$a0,$s2
	syscall
	j	exit
	

