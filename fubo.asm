.data
	tb1:	.asciiz	"nhap n: "
	tb2:	.asciiz	"fubo: "
.text
.globl main
main:
	li	$v0,4
	la	$a0,tb1
	syscall
	li	$v0,5
	syscall
	move	$a0,$v0
	jal 	fibo
	
	move	$t0,$v0
	move	$t1,$a0
	li	$v0,4
	la	$a0,tb2
	syscall
	
	li	$v0,1
	move	$a0,$t0
	syscall
	
	li	$v0,10
	syscall
.globl fibo
fibo:
	addi	$sp,$sp,-12	#tao con tro
	sw	$ra,8($sp)	#luu du lieu $ra de quay ve
	sw	$a0,4($sp)	#luu du lieu n hien gio
	#if(n==0)F(n)=0 return 0
	slti	$t0,$a0,1	#n>1
	beq	$t0,$0,L1	#n>1 thi nhay den L1
	li	$v0,0		#n=0 thi f(n)=$v0=0
	addi	$sp,$sp,12	#tra lai con tro sau khi them de tinh F(1)
	jr	$ra		#quay ve truoc F(n+1)
L1:	#if(n==1) F(n)=1 return 1
	slti	$t0,$a0,2	#n>2?
	beq	$t0,$0,L2	#n>2 thi nhay den L2
	li	$v0,1		#n=1 thi F(n)=$v0=1
	addi	$sp,$sp,12	#tra lai con tr0
	jr	$ra		#nhay ve truoc F(n+1)
L2:	#return F(n-1)+F(n-2)
	addi	$a0,$a0,-1	#n=n-1 		
	jal	fibo		#quay ve vong lap tinh f(n-1)
	sw	$v0,0($sp)	#luu du lieu F(n-1)=$v0 vao 
	lw	$a0,4($sp)	#luu du lieu n hien gio
	addi	$a0,$a0,-2	#n=n-2
	jal	fibo		#quay ve vong lap tinh f(n-2)
	lw	$t0,0($sp)	#lay gia tri F(n-2)=$t0
	add	$v0,$v0,$t0	#F(n)=F(n-1)+F(n-2)
	
	lw	$a0,4($sp)	#tra ve gia tri n nguyen ban
	lw	$ra,8($sp)	#tra ve con tro toi ham main
	addi	$sp,$sp,12	#tra lai bo nho
	jr	$ra		#nhay toi ham main
	