.data
	text1:	.asciiz "case1"
	text2:	.asciiz "case2"
	text3:	.asciiz "case3"
	default1:.asciiz"default"
.text
.globl main
main:
	li	$v0,5
	syscall
	move	$t0,$v0		#$t0=n
	
case1:
	add	$t1,$0,1
	bne	$t1,$t0,case2
	li	$v0,4
	la	$a0,text1
	syscall
	j	end
case2:
	add	$t1,$0,2
	bne	$t1,$t0,case3
	li	$v0,4
	la	$a0,text2
	syscall
	j	end	
case3:
	add	$t1,$0,3
	bne	$t1,$t0,default
	li	$v0,4
	la	$a0,text3
	syscall
	j	end
default:
	li	$v0,4
	la	$a0,default1
	syscall
end:	
	li	$v0,10
	syscall
	